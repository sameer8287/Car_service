import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/services.dart';
// import 'package:justino_icons/justino_icons.dart';
import 'imagesListView.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currindex = 0;
  double topbar = 180;
  TextEditingController location = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double statusBarheight = MediaQuery.of(context).padding.top;
    return Scaffold(
      // appBar: AppBar(
      //   systemOverlayStyle: SystemUiOverlayStyle(
      //     statusBarColor: Colors.transparent
      //   ),

      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: statusBarheight),
              width: MediaQuery.of(context).size.width,
              height: topbar+statusBarheight,
              decoration: const BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                )
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15,20,0,0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment:  CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0,0,20,0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.menu,color: Colors.white,size: 35,),
                              Icon(Icons.account_circle,color: Colors.white,size: 35,),


                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Book Car Service',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 21
                        ),),

                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0,10,0,0),
                                child: TextFormField(
                                  controller: location,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    prefixIcon: Icon(Icons.my_location),
                                    hintText: 'Vijay nagar, Indore',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50)
                                    )
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 100,
                              child: FloatingActionButton(
                                backgroundColor: Colors.white,
                                  onPressed: (){},
                                  child: Icon(Icons.add,
                                  color: Colors.deepOrange,),),
                            )


                          ],
                        )
                      ],
                    ),
                  ),
                ],
              )

            ),
            Imagelist(),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 20),
              child :Text('Service for you',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400
                ),),
            ),
            Container(
              height: 400,
              // color: Colors.lightGreen,
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: resusableCard(title: 'Cab Booking',icon: Icons.drive_eta,)),
                      Expanded(child: resusableCard(title: 'Hire Driver', icon: Icons.account_circle)),
                      Expanded(child: resusableCard(title: 'FastTag Recharge', icon: Icons.toll_sharp))
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: resusableCard(title: 'Motor Insurance',icon: Icons.receipt_long,)),
                      Expanded(child: resusableCard(title: 'Fuel Price', icon: Icons.local_gas_station_sharp)),
                      Expanded(child: resusableCard(title: 'Challan Info', icon: Icons.receipt))
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: resusableCard(title: 'Traffic Fine',icon: Icons.traffic,)),
                      Expanded(child: resusableCard(title: 'RC Services', icon: Icons.credit_card)),
                      Expanded(child: Container())
                    ],
                  ),
                  ElevatedButton(onPressed: (){}, child: Text('View All'))


                ],
              ),
            )

          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Colors.white24,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.deepOrange,
        currentIndex: _currindex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home,),
              label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Driver'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.design_services),
              label: 'Services'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              label: 'Account',
          )


        ],
        onTap: (index){
          setState(() {
            _currindex = index;
          });
        },
      ),
    );
  }
}

class resusableCard extends StatelessWidget {
  final String title;
  final IconData icon;
  const resusableCard({
    super.key,
    required this.title,
    required this.icon
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                  icon,
                  size: 60,
                  color: Colors.deepOrange,),
              Text(title,
              style: TextStyle(
                fontWeight: FontWeight.w400
              ),)

            ],
          ),
        ),
      ),
    );
  }
}
