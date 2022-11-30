import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:noor_moden/models/Images_Model.dart';

class CustomSlider extends StatefulWidget {
  final List<ImagesModel> bannerImagesList;
  const CustomSlider(
    this.bannerImagesList,
  );

  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: CarouselSlider(
        items: widget.bannerImagesList
            .map(
              (item) => Container(
                  margin: const EdgeInsets.all(5.0),
                  child: ClipRRect(
                      child: Stack(
                    children: <Widget>[
                      Image.network(item.bgImage!,
                          fit: BoxFit.cover, width: double.infinity,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                            child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ));
                      }),
                      Positioned(
                        top: 90.0,
                        right: 160,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              item.title!,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                              ),

                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10.0),
                              height: 4.0,
                              width: 25.0,
                              color: Colors.black,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                item.shortDes!,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.normal,
                                ),

                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 15.0,right: 15.0,top: 3.0,bottom: 3.0),
                              margin: const EdgeInsets.only(top: 14.0),
                              color: Colors.black,
                              child: const Text("Discover the collection",textAlign: TextAlign.center ,style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                            )
                          ],
                        ),
                      ),
                    ],
                  ))),
            )
            .toList(),
        options: CarouselOptions(
          autoPlay: true,
          enlargeCenterPage: true,
          enlargeStrategy: CenterPageEnlargeStrategy.height,
           height: 500,
        ),
        carouselController: _controller,
      ),
    );
  }
}
