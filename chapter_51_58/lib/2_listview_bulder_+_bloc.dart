import 'dart:math';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'produt_cart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainPage(),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  final Random r = Random();
  @override
  Widget build(BuildContext context) {
    ProductBloc bloc = BlocProvider.of<ProductBloc>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: firstColor,
        title: Text('ListView Bulder + BLoC'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          RaisedButton(
            child: Text(
              'Create Product',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            color: firstColor,
            onPressed: () {
              bloc.add(r.nextInt(4) + 2);
            },
          ),
          SizedBox(
            height: 20,
          ),
          BlocBuilder<ProductBloc, List<Product>>(
            builder: (context, product) => Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: product.length,
                  itemBuilder: (context, index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        (index == 0)
                            ? SizedBox(
                                width: 20,
                              )
                            : Container(),
                        ProdutCart(
                          imageURL: product[index].imageUrl,
                          name: product[index].name,
                          price: product[index].price.toString(),
                          onAddChartTap: () {},
                          onDecTap: () {},
                          onIncTap: () {},
                          quantity: 0,
                        ),
                        SizedBox(
                          width: 20,
                        )
                      ],
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

class Product {
  String imageUrl;
  String name;
  int price;

  Product({
    this.imageUrl = '',
    this.name = '',
    this.price = 0,
  });
}

class ProductBloc extends Bloc<int, List<Product>> {
  @override
  List<Product> get initialState => [];

  @override
  Stream<List<Product>> mapEventToState(int event) async* {
    List<Product> product = [];
    for (int i = 0; i < event; i++)
      product.add(
        Product(
            imageUrl:
                "https://i.pinimg.com/564x/40/d9/be/40d9beee2bc34ff545dc5eccd3ea2a94.jpg",
            name: "Produk " + i.toString(),
            price: (i + 1) * 5000),
      );

    yield product;
  }
}
