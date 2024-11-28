import 'package:bitaqwa_app/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailVidioScreen extends StatefulWidget {
  final String title;
  final String ustadz;
  final String account;
  final String url;
  final String description;

  const DetailVidioScreen({
    super.key,
    required this.title,
    required this.ustadz,
    required this.account,
    required this.url,
    required this.description,
  });

  @override
  State<DetailVidioScreen> createState() => _DetailVidioScreenState();
}

class _DetailVidioScreenState extends State<DetailVidioScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.url)!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.colorPrimary,
        title: Text(
          widget.title,
          style: const TextStyle(
            fontFamily: 'PoppinsMedium',
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.greenAccent,
            onReady: () {
              _controller.addListener(() {
                setState(() {});
              });
            },
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.account,
                    style: const TextStyle(
                      fontFamily: 'PoppinsRegular',
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    widget.ustadz,
                    style: const TextStyle(
                      fontFamily: 'PoppinsRegular',
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    textAlign: TextAlign.justify,
                    widget.title,
                    style: const TextStyle(
                      fontFamily: 'PoppinsBold',
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    widget.description,
                    style: const TextStyle(
                      fontFamily: 'PoppinsRegular',
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
