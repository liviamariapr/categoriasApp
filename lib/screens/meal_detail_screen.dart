import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {

  _createSectionTitle(BuildContext context,String text){
    return Container(
          margin:EdgeInsets.symmetric(vertical:10),
          child: Text(
            text,
            style:Theme.of(context).textTheme.titleMedium,
          ),
        );
  }

 Widget _createSectionContainer(Widget child){
  return Container(
          width:300,
          height: 250,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: child,
        );
 }
 

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as Meal;
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column (
          children: <Widget>[
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
            )
          ),
          _createSectionTitle(context,'Ingredientes'),
          _createSectionContainer(
            ListView.builder(
              itemCount: meal.ingredients.length,
              itemBuilder: (cxt,index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(meal.ingredients[index]),
                  ),
                  color: Theme.of(context).colorScheme.secondary,
                );
              }
            ),
          ),
          _createSectionTitle(context,'Passos'),
          _createSectionContainer(
            ListView.builder(
              itemCount: meal.steps.length,
              itemBuilder: (cxt,index) {
                return Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      child: Text('${index + 1}'),
                    ),
                    title: Text(meal.steps[index]),
                  ),
                );
              }
            ),
          ),
        ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.star),
        onPressed: () {
          Navigator.of(context).pop(meal.title);
        },
      ),
    );
  }
}