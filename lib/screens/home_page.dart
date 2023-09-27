import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text('Hydroponic system')),
      drawer: Drawer(),
      body: ListView( 
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
              )
            ),
            const SizedBox( 
              height: 400,
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 300,
                    child: Column(
                      children: [
                        Expanded(
                          child: Card(
  //shape: Theme.of(context).cardTheme.shape,
                          child:  SizedBox(
                                    width: 200,
                                    height: 300,
                                     ),
                                    ),
                        ),
                        Expanded(
                          child: Card(
  //shape: Theme.of(context).cardTheme.shape,
                    child: SizedBox(
                            width: 200,
                            height: 300,
                              ),
                            ),
                        ),
                      ],
                    )
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 300,
                    child: Column(
                      children: [
                             Expanded(
                          child: Card(
  //shape: Theme.of(context).cardTheme.shape,
                          child:  SizedBox(
                                    width: 200,
                                    height: 300,
                                     ),
                                    ),
                        ),
                        Expanded(
                          child: Card(
  //shape: Theme.of(context).cardTheme.shape,
                    child: SizedBox(
                            width: 200,
                            height: 300,
                              ),
                            ),
                        ),
                      ],
                    )
                  ),
                ),
                      ],
                    )
                  ),
  ])
              
            );
          
  }
}