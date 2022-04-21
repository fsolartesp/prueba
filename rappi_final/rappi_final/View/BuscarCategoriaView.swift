//
//  BuscarCategoriaView.swift
//  rappi_final
//
//  Created by fredy on 20/04/22.
//

import SwiftUI


struct BuscarCategoriaView: View {
    @State var textobuscado=""
    var body: some View {
        NavigationView{
        ScrollView{
            //HStack	{
            //    TextField("Buscar Categoria",text: $textobuscado)
            //}
            HStack    {
                Text("")
            }
            HStack    {
                Text("Animacion")
            }
            HStack    {
                Text("Aventura")
            }
            HStack    {
                Text("Belica")
            }
            HStack    {
                Text("Ciencia Ficcion")
            }
            HStack    {
                Text("Crimen")
            }
            HStack    {
                Text("Documental")
            }
            HStack    {
                Text("Drama")
            }
            HStack    {
                Text("Familia")
            }
            
        }
        .navigationBarTitle("Categorias")
        }
    }
}

struct BuscarCategoriaView_Previews: PreviewProvider {
    static var previews: some View {
        BuscarCategoriaView()
    }
}
