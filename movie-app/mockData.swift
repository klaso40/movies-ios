//
//  mockData.swift
//  movie-app
//
//  Created by Matúš Klasovitý on 14/04/2022.
//

import Foundation

struct MockData {
    static let movies = [
        Movie(
            id: 1,
            name: "Inglorious basterds",
            posterURL: URL(string: "https://movieposters2.com/images/782684-b.jpg")!,
            backdropURL:  URL(string: "https://movieposters2.com/images/782684-b.jpg")!,
            rating: 4.5,
            overview: """
            Soufflé danish dessert jelly beans gummi bears dessert danish sesame snaps cake. Candy oat cake tart halvah tart apple pie croissant tart cheesecake. Cupcake
            ice cream chocolate cake gummies jujubes pastry gingerbread. Pudding jelly beans carrot cake marzipan cotton candy wafer cupcake marzipan dessert.
                     
            Tiramisu topping soufflé cake chocolate soufflé. Fruitcake sesame snaps marzipan jelly wafer. Donut gingerbread lollipop muffin pastry cake jelly beans muffin sweet. Dragée marzipan chocolate bar fruitcake fruitcake apple pie.

            Oat cake caramels lollipop icing apple pie marzipan chocolate cake croissant. Lemon drops tart jelly danish gummies chocolate cake topping sweet roll carrot cake. Marshmallow lollipop cupcake jelly beans liquorice liquorice powder fruitcake powder. Candy dessert brownie toffee biscuit.
            """,
            genres: [
                Genre(id: 1, name: "Drama"),
                Genre(id: 2, name: "Horror")
            ],
            releaseDate: "10.04.2022",
            runtime: 125,
            budget: "10000USD",
            cast: [
                Actor(
                    id: 1,
                    name: "Very long actor name",
                    characterName: "Main character",
                    profilePhoto: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4c/Brad_Pitt_2019_by_Glenn_Francis.jpg/220px-Brad_Pitt_2019_by_Glenn_Francis.jpg")!
                ),
                Actor(
                    id: 2,
                    name: "Brad Pitt",
                    characterName: "Main character",
                    profilePhoto: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4c/Brad_Pitt_2019_by_Glenn_Francis.jpg/220px-Brad_Pitt_2019_by_Glenn_Francis.jpg")!
                ),
                Actor(
                    id: 3,
                    name: "Brad Pitt",
                    characterName: "Main character",
                    profilePhoto: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4c/Brad_Pitt_2019_by_Glenn_Francis.jpg/220px-Brad_Pitt_2019_by_Glenn_Francis.jpg")!
                ),
                Actor(
                    id: 4,
                    name: "Brad Pitt",
                    characterName: "Main character",
                    profilePhoto: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4c/Brad_Pitt_2019_by_Glenn_Francis.jpg/220px-Brad_Pitt_2019_by_Glenn_Francis.jpg")!
                ),
                Actor(
                    id: 5,
                    name: "Brad Pitt",
                    characterName: "Main character",
                    profilePhoto: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4c/Brad_Pitt_2019_by_Glenn_Francis.jpg/220px-Brad_Pitt_2019_by_Glenn_Francis.jpg")!
                ),
                
            ]
        ),
        Movie(
            id: 2,
            name: "Titanic",
            posterURL: URL(string: "https://m.media-amazon.com/images/I/713cdKBBjqL._AC_SY741_.jpg")!,
            backdropURL: URL(string: "https://m.media-amazon.com/images/I/713cdKBBjqL._AC_SY741_.jpg")!,
            rating: 4.5,
            overview: """
            Tiramisu topping soufflé cake chocolate soufflé. Fruitcake sesame snaps marzipan jelly wafer. Donut gingerbread lollipop muffin pastry cake jelly beans muffin sweet. Dragée marzipan chocolate bar fruitcake fruitcake apple pie.

            Oat cake caramels lollipop icing apple pie marzipan chocolate cake croissant. Lemon drops tart jelly danish gummies chocolate cake topping sweet roll carrot cake. Marshmallow lollipop cupcake jelly beans liquorice liquorice powder fruitcake powder. Candy dessert brownie toffee biscuit.
            """,
            genres: nil,
            releaseDate: nil,
            runtime: nil,
            budget: nil,
            cast: nil
            
        ),
        Movie(
            id: 3,
            name: "Le Mans 66",
            posterURL: URL(string: "https://kamnahorehroni.sk/wp-content/uploads/2019/11/LeMans66-US-1sheetRegularAdvance.jpg")!,
            backdropURL: URL(string: "https://kamnahorehroni.sk/wp-content/uploads/2019/11/LeMans66-US-1sheetRegularAdvance.jpg")!,
            rating: 4.5,
            overview: """
            Tiramisu topping soufflé cake chocolate soufflé. Fruitcake sesame snaps marzipan jelly wafer. Donut gingerbread lollipop muffin pastry cake jelly beans muffin sweet. Dragée marzipan chocolate bar fruitcake fruitcake apple pie.

            Oat cake caramels lollipop icing apple pie marzipan chocolate cake croissant. Lemon drops tart jelly danish gummies chocolate cake topping sweet roll carrot cake. Marshmallow lollipop cupcake jelly beans liquorice liquorice powder fruitcake powder. Candy dessert brownie toffee biscuit.
            """,
            genres: nil,
            releaseDate: nil,
            runtime: nil,
            budget: nil,
            cast: nil
            
        ),
        Movie(
            id: 4,
            name: "Rush",
            posterURL: URL(string: "https://picfiles.alphacoders.com/121/thumb-1920-121234.jpg")!,
            backdropURL: URL(string: "https://picfiles.alphacoders.com/121/thumb-1920-121234.jpg")!,
            rating: 4.5,
            overview: """
            Tiramisu topping soufflé cake chocolate soufflé. Fruitcake sesame snaps marzipan jelly wafer. Donut gingerbread lollipop muffin pastry cake jelly beans muffin sweet. Dragée marzipan chocolate bar fruitcake fruitcake apple pie.

            Oat cake caramels lollipop icing apple pie marzipan chocolate cake croissant. Lemon drops tart jelly danish gummies chocolate cake topping sweet roll carrot cake. Marshmallow lollipop cupcake jelly beans liquorice liquorice powder fruitcake powder. Candy dessert brownie toffee biscuit.
            """,
            genres: nil,
            releaseDate: nil,
            runtime: nil,
            budget: nil,
            cast: nil
        ),
        Movie(
            id: 5,
            name: "Pulp fiction",
            posterURL: URL(string: "https://globestudiogallery.com/wp-content/uploads/2021/06/pulp-fiction-scaled.jpg")!,
            backdropURL: URL(string: "https://picfiles.alphacoders.com/121/thumb-1920-121234.jpg")!,
            rating: 4.5,
            overview: """
            Tiramisu topping soufflé cake chocolate soufflé. Fruitcake sesame snaps marzipan jelly wafer. Donut gingerbread lollipop muffin pastry cake jelly beans muffin sweet. Dragée marzipan chocolate bar fruitcake fruitcake apple pie.

            Oat cake caramels lollipop icing apple pie marzipan chocolate cake croissant. Lemon drops tart jelly danish gummies chocolate cake topping sweet roll carrot cake. Marshmallow lollipop cupcake jelly beans liquorice liquorice powder fruitcake powder. Candy dessert brownie toffee biscuit.
            """,
            genres: nil,
            releaseDate: nil,
            runtime: nil,
            budget: nil,
            cast: nil
        ),
        Movie(
            id: 6,
            name: "Shawshank redemption",
            posterURL: URL(string: "https://m.media-amazon.com/images/M/MV5BMDFkYTc0MGEtZmNhMC00ZDIzLWFmNTEtODM1ZmRlYWMwMWFmXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_FMjpg_UX1000_.jpg")!,
            backdropURL: URL(string: "https://m.media-amazon.com/images/M/MV5BMDFkYTc0MGEtZmNhMC00ZDIzLWFmNTEtODM1ZmRlYWMwMWFmXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_FMjpg_UX1000_.jpg")!,
            rating: 4.5,
            overview: """
            Tiramisu topping soufflé cake chocolate soufflé. Fruitcake sesame snaps marzipan jelly wafer. Donut gingerbread lollipop muffin pastry cake jelly beans muffin sweet. Dragée marzipan chocolate bar fruitcake fruitcake apple pie.

            Oat cake caramels lollipop icing apple pie marzipan chocolate cake croissant. Lemon drops tart jelly danish gummies chocolate cake topping sweet roll carrot cake. Marshmallow lollipop cupcake jelly beans liquorice liquorice powder fruitcake powder. Candy dessert brownie toffee biscuit.
            """,
            genres: nil,
            releaseDate: nil,
            runtime: nil,
            budget: nil,
            cast: nil
        ),
    ]
}


