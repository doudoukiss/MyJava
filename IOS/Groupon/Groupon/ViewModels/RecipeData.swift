//
//  RecipeData.swift
//  Groupon
//
//  Created by Seattle on 2023/5/7.
//

import Foundation

class RecipeData: ObservableObject {
    @Published var recipes = Recipe.testRecipes
}
