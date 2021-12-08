import 'package:evtoelon/models/car.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  final TextEditingController? _controller = TextEditingController();
  var items = ['y.e', "so`m", 'dollar'];
  String text = 'y.e';

  @override
  Widget build(BuildContext context) {
    final args =
    ModalRoute.of(context)!.settings.arguments as Map<String, Car>;

    Car? car = args['car'];

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 8, left: 8),
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(Icons.arrow_back_rounded),
                                  ),
                                ),
                              ),
                               Expanded(
                                flex: 3,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 8.0, top: 8),
                                  child: Text(
                                    car!.label,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, top: 8.0),
                                  child: Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.share,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.star_border,
                                          color: Colors.blue,
                                          size: 30,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.all(10.0),
                            width: double.infinity,
                            height: 250,
                            child:  Image(
                              fit: BoxFit.cover,
                              image: AssetImage(car!.imageUrl),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, top: 8.0),
                                child: Row(
                                  children: const [
                                    Text(
                                      '9 000',
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Container(
                                  padding: const EdgeInsets.only(left: 10),
                                  width: 90,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(color: Colors.grey),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex: 6,
                                          child: Container(
                                            margin:
                                                const EdgeInsets.only(left: 5),
                                            child: Text(
                                              '$text',
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.lightBlue,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          )),
                                      Expanded(
                                        flex: 5,
                                        child: PopupMenuButton<String>(
                                          icon: const Icon(
                                            Icons.keyboard_arrow_down_sharp,
                                            color: Colors.lightBlue,
                                          ),
                                          onSelected: (String value) {
                                            _controller!.text = value;
                                            setState(() {
                                              text = _controller!.text;
                                            });
                                          },
                                          itemBuilder: (BuildContext context) {
                                            return items
                                                .map<PopupMenuItem<String>>(
                                                    (String value) {
                                              return PopupMenuItem(
                                                  child: Text(value),
                                                  value: value);
                                            }).toList();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                           Padding(
                            padding: EdgeInsets.all(14.0),
                            child: Text(
                              car!.info,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black87),
                            ),
                          )
                        ],
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(left: 12),
                                  child: Text(
                                    'Shahar',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.grey),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  car!.country,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(left: 12),
                                  child: Text(
                                    'Kuzov',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.grey),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  car!.kuzov,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(left: 12),
                                  child: Text(
                                    'Uztish qutisi',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.grey),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  car!.uzatish,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(left: 12),
                                  child: Text(
                                    'Rangi',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.grey),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  car!.color,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(left: 12),
                                  child: Text(
                                    'Uzatma',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.grey),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'Oldi',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(left: 12),
                                  child: Text(
                                    'Kami bor',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.grey),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  car!.kamibor,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(left: 12),
                                  child: Text(
                                    'Divigator',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.grey),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  car!.dv,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 12,
                          ),
                        ],
                      ),
                    ),
                    Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 13,
                            ),
                            child: Text(
                              'Optiya va xarakteristikalar',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(left: 13, right: 30, top: 10),
                            width: double.infinity,
                            child: Text(
                              car!.xr,
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black87),
                            ),
                          ),
                          SizedBox(height: 70,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 10,
                left: 15,
                right: 15,
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: (){

                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          width: double.infinity,
                          height: 50,
                          child: Text(
                            'Yozish',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        width: double.infinity,
                        height: 50,
                        child: Text(
                          "Qo'ng'iroq qilish",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
