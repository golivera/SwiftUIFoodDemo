//
//  MealService.swift
//  BlankSwiftUIProject
//
//  Created by Gary on 10/30/23.
//

import Foundation


enum CustomError:Error {
    case decodingError
    case serverError
    case noDataError
}

enum MealAPI {
    case desserts
    case details(Int)

    func url() -> URL {
        let base = "https://themealdb.com/api/"

        switch self {
        case .desserts:
            return URL(string: base + "json/v1/1/filter.php?c=Dessert")!
        case .details(let mealId):
            return URL(string: base + "json/v1/1/lookup.php?i=\(mealId)")!
        }
    }
}

protocol MealServicing {
    func fetchAllDesserts(completion: @escaping (Result<[Meal], Error>) -> Void)
    func fetchAllMeals(endpoint: MealAPI, completion: @escaping (Result<[Meal], Error>) -> Void)
    func fetchMealDetails(endpoint: MealAPI, completion: @escaping (Result<MealDetails, Error>) -> Void)
}

struct MealService: MealServicing {
    func fetchAllDesserts(completion: @escaping (Result<[Meal], Error>) -> Void) {
        return fetchAllMeals(endpoint: MealAPI.desserts, completion: completion)
    }

    func fetchAllMeals(endpoint: MealAPI, completion: @escaping (Result<[Meal], Error>) -> Void) {
        let url = endpoint.url()
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
                completion(.failure(CustomError.serverError))
            } else {
                guard let data = data else {
                    completion(.failure(CustomError.noDataError))
                    return
                }

                let decoder = JSONDecoder()
                do {
                    let response: MealResponse = try decoder.decode(MealResponse.self, from: data)
                    let meals: [Meal] = response.meals
                    completion(.success(meals))
                } catch {
                    completion(.failure(CustomError.decodingError))
                }
            }
        }.resume()
    }

    func fetchMealDetails(endpoint: MealAPI, completion: @escaping (Result<MealDetails, Error>) -> Void) {
        let url = endpoint.url()
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            } else {
                guard let data = data else {
                    completion(.failure(CustomError.noDataError))
                    return
                }

                let decoder = JSONDecoder()
                do {
                    let response = try decoder.decode(MealDetailResponse.self, from: data)
                    completion(.success(response.meals[0]))
                } catch {
                    completion(.failure(CustomError.decodingError))
                }
            }
        }.resume()
    }
}
