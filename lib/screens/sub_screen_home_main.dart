// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:task12/models/category.dart';
import 'package:task12/models/product.dart';
import 'package:task12/utils/app_colors.dart';
import 'package:task12/utils/fake_data.dart';

class SubScreenHomeMain extends StatelessWidget {

  final Function() _goToProductDetails;

  SubScreenHomeMain(this._goToProductDetails);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Expanded(
        child: Column(
          children: [
            SizedBox(
              height: 75,
              child: Center(
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: FakeData.categories.length,
                  itemBuilder: (context, index) {
                    var category = FakeData.categories[index];

                    return _CategoryWidget(category);
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 18,);
                  },
                ),
              ),
            ),
            SizedBox(height: 16,),
            Expanded(
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                itemCount: FakeData.products.length ~/ 2,
                itemBuilder: (context, index) {
                  var firstIndex = index * 2;
                  var secondIndex = firstIndex + 1;

                  var firstProduct = FakeData.products[firstIndex];
                  var secondProduct = FakeData.products[secondIndex];

                  return _ProductWidget(firstProduct, secondProduct);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 16,);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryWidget extends StatelessWidget {

  final Category category;

  _CategoryWidget(this.category);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 45,
          height: 45,
          //color: AppColors.primaryText,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            color: AppColors.primaryText,
          ),
          child: Icon(
            category.iconData,
            color: AppColors.onPrimaryText,
          ),
        ),
        SizedBox(height: 8,),
        Text(
          category.name,
          style: TextStyle(
            color: AppColors.primaryText,
          ),
        ),
      ],
    );
  }
}

class _ProductWidget extends StatelessWidget {

  final Product firstProduct;
  final Product secondProduct;

  _ProductWidget(this.firstProduct, this.secondProduct);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _ProductWidgetSingle(firstProduct)
        ),
        SizedBox(width: 16,),
        Expanded(
          child: _ProductWidgetSingle(secondProduct),
        ),
      ],
    );
  }
}

class _ProductWidgetSingle extends StatelessWidget {

  final Product product;

  _ProductWidgetSingle(this.product);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 240,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  product.image,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 8,
                right: 8,
                child: IconButton(
                  onPressed: () {},
                  iconSize: 24,
                  icon: Icon(Icons.shopping_bag, color: AppColors.onPrimaryText,),
                  padding: EdgeInsets.all(5),
                  constraints: BoxConstraints(),
                  color: AppColors.secondaryText,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondaryText.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    //maximumSize: Size(21, 21),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 8,),
        Text(
          product.name,
          style: TextStyle(
            color: AppColors.secondaryText,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        SizedBox(height: 4,),
        Text(
          "\$ ${product.price}",
          style: TextStyle(
            color: AppColors.primaryText,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}



