import '/mock/mock_compound_content.dart';
import 'package:compound_widgets/compound_widgets.dart';
import 'package:flutter/material.dart';
import 'package:plover/plover.dart';

class ShelvesContentProvider {
  // Generated Shelves from the design. Substitute it with TV content provider.
  static final List<MapEntry<String, Widget>> children = [
    MapEntry(
        '''Shelf List''',
        ContentShelfListView(
            animatedScale: 1.15,
            animDuration: 400,
            cacheExtent: null,
            childMargin: 48.0,
            delayAutoScroll: 500,
            direction: Axis.horizontal,
            exitAnimCurve: Curves.elasticInOut,
            enterAnimCurve: Curves.easeOutBack,
            itemBuilder: (BuildContext childContext, int index, bool isFocus) {
              return ContentShelfItem(
                imgUrl: MockCompoundContent.contentShelfImages[index],
              );
            },
            headerTitle: '''Shelf List View''',
            headerTitleAlign: WMarqueeAlign.left,
            headerTitleAlwaysScroll: false,
            headerTitleAnimOffset: null,
            headerTitleFocused: false,
            headerTitleHeight: null,
            headerTitleHoverStyle: const TextStyle(
                fontFamily: '''LG Smart UI''',
                fontSize: 54.0,
                height: 1.0,
                fontWeight: FontWeight.w400,
                color: Color(0x00000000)),
            headerTitleMarqueeSpacing: 20.0,
            headerTitlePadding: EdgeInsets.only(
              left: 5.0,
              top: 5.0,
              right: 5.0,
              bottom: 5.0,
            ),
            headerTitleTextStyle: const TextStyle(
                fontFamily: '''LG Smart UI''',
                fontSize: 54.0,
                height: 1.0,
                fontWeight: FontWeight.w400,
                color: Color(0xFFFFFFFF)),
            headerTitleUsingDefaultMouseRegion: true,
            headerTitleVelocity: 50.0,
            headerTitleWidth: null,
            height: 534.0,
            initialOfFocused: null,
            isLoading: false,
            isRTL: false,
            itemCount: 8,
            longPressDuration: Duration(milliseconds: 1),
            padding: EdgeInsets.only(
              left: 5.0,
              top: 5.0,
              right: 5.0,
              bottom: 5.0,
            ),
            scrollType: Curves.linear,
            scrollZone: 60.0,
            shelfId: '''''',
            shouldScaleFirstAndLastItemFromEdge: true,
            speedScrolling: 1.0,
            typeVoiceItemHeader: VCIntent.delete,
            width: 2688.0)),
    MapEntry(
        '''Now Streaming''',
        NowStreamingWidget(
            contents: [
              {
                "id": "youtube",
                "contents": [
                  {
                    "category": "",
                    "contentId": "f936b123-a2fa-4699-8b46-e5a736ca577c",
                    "onClick": {"contentId": "", "targetAppId": "youtube.leanback.v4", "launchParam": null},
                    "image": {
                      "url": "assets/compound_images/streaming/youtube.png",
                      "width": 0,
                      "bgColor": "#ffffff",
                      "height": 0
                    },
                    "promotionId": "",
                    "type": "title",
                    "image_4k": {"url": "", "width": 0, "bgColor": "", "height": 0},
                    "titleText": ""
                  },
                  {
                    "category": "최신",
                    "contentId": "d694a0d9-d2cc-4297-b46d-a0203bff9db5",
                    "onClick": {
                      "contentId": "v=LX-HJUxyyH0",
                      "targetAppId": "youtube.leanback.v4",
                      "launchParam": null
                    },
                    "image": {
                      "url": "https://i.ytimg.com/vi/LX-HJUxyyH0/hqdefault.jpg",
                      "width": 480,
                      "bgColor": "",
                      "height": 360
                    },
                    "promotionId": "",
                    "type": "content",
                    "image_4k": {
                      "url": "https://i.ytimg.com/vi/LX-HJUxyyH0/maxresdefault.jpg",
                      "width": 1280,
                      "bgColor": "",
                      "height": 720
                    },
                    "titleText": "밥 보다 연애 먼저 - 봄 소풍 가서 한강 라면 & 도시락 편 밥 보다 연애 먼저 - 봄 소풍 가서 한강 라면 & 도시락 편"
                  },
                  {
                    "category": "최신",
                    "contentId": "ff8c2d10-8b7b-4a90-885d-18f27348ffd3",
                    "onClick": {
                      "contentId": "v=E1OrE2t0nlM",
                      "targetAppId": "youtube.leanback.v4",
                      "launchParam": null
                    },
                    "image": {
                      "url": "https://i.ytimg.com/vi/E1OrE2t0nlM/hqdefault.jpg",
                      "width": 480,
                      "bgColor": "",
                      "height": 360
                    },
                    "promotionId": "",
                    "type": "content",
                    "image_4k": {
                      "url": "https://i.ytimg.com/vi/E1OrE2t0nlM/maxresdefault.jpg",
                      "width": 1280,
                      "bgColor": "",
                      "height": 720
                    },
                    "titleText": "파묘 600만 감사합니다"
                  },
                  {
                    "category": "인기",
                    "contentId": "141bcfe6-9bac-4a64-aaed-216a1060046a",
                    "onClick": {
                      "contentId": "v=nU4Iao8eCaE",
                      "targetAppId": "youtube.leanback.v4",
                      "launchParam": null
                    },
                    "image": {
                      "url": "https://i.ytimg.com/vi/nU4Iao8eCaE/hqdefault.jpg",
                      "width": 480,
                      "bgColor": "",
                      "height": 360
                    },
                    "promotionId": "",
                    "type": "content",
                    "image_4k": {
                      "url": "https://i.ytimg.com/vi/nU4Iao8eCaE/maxresdefault.jpg",
                      "width": 1280,
                      "bgColor": "",
                      "height": 720
                    },
                    "titleText": "손흥민, 13호골 폭발+최고 평점+MOM까지 싹쓸이 #SPOTIME"
                  },
                  {
                    "category": "인기",
                    "contentId": "16dae640-9bcd-4c60-9860-b19c896ff056",
                    "onClick": {
                      "contentId": "v=KNexS61fjus",
                      "targetAppId": "youtube.leanback.v4",
                      "launchParam": null
                    },
                    "image": {
                      "url": "https://i.ytimg.com/vi/KNexS61fjus/hqdefault.jpg",
                      "width": 480,
                      "bgColor": "",
                      "height": 360
                    },
                    "promotionId": "",
                    "type": "content",
                    "image_4k": {
                      "url": "https://i.ytimg.com/vi/KNexS61fjus/maxresdefault.jpg",
                      "width": 1280,
                      "bgColor": "",
                      "height": 720
                    },
                    "titleText": "LE SSERAFIM (르세라핌) 'Smart' OFFICIAL MV"
                  }
                ]
              },
              {
                "id": "amazone",
                "contents": [
                  {
                    "image": {
                      "url": "assets/compound_images/streaming/icon.png",
                      "width": 0,
                      "bgColor": "#5C75B8",
                      "height": 0
                    },
                    "category": "",
                    "titleText": "",
                    "onClick": {"contentId": "", "targetAppId": "amazon", "launchParam": ""},
                    "type": "title",
                    "contentId": "b9a10a49-14f1-4f1e-9511-640c82098c0b"
                  },
                  {
                    "vod": true,
                    "image": {
                      "url":
                          "https://images-fe.ssl-images-amazon.com/images/S/pv-target-images/827d727c21ffd6deda6c3ae7c5d38f0a4bb116517c19082fcb21295b8780831b._RI_TTW_._UR960,540_.png",
                      "width": 960,
                      "height": 540
                    },
                    "category": "Amazon Originals",
                    "titleText": "Kids Are Growing Up: A Story About A Kid Named LAROI",
                    "onClick": {
                      "contentId":
                          "detail?gti=amzn1.dv.gti.d6f457c0-a48a-493c-90ec-7bee9d1c5621&refMarker=dvm_liv_lgt_kr_bd_x_rec_pear",
                      "targetAppId": "amazon",
                      "launchParam": ""
                    },
                    "type": "content",
                    "onShow": {
                      "method": "invoke",
                      "service": "amazon.service",
                      "contentId":
                          "detail?gti=amzn1.dv.gti.d6f457c0-a48a-493c-90ec-7bee9d1c5621&refMarker=dvm_liv_lgt_kr_bd_x_rec_pear"
                    },
                    "contentId": "5e6bc981-170c-4458-b4ba-0365629e4883"
                  },
                  {
                    "vod": true,
                    "image": {
                      "url":
                          "https://images-fe.ssl-images-amazon.com/images/S/pv-target-images/1109e8e630d596b85089ad8384970580e64e222141c47dc2051fe6eef17d0b9d._RI_TTW_._UR960,540_.jpg",
                      "width": 960,
                      "height": 540
                    },
                    "category": "Amazon Originals",
                    "titleText": "Red Queen – Season 1",
                    "onClick": {
                      "contentId":
                          "detail?gti=amzn1.dv.gti.ef0b8570-d50b-46e9-8b97-6b65ff6b0f07&refMarker=dvm_liv_lgt_kr_bd_x_rec_pear",
                      "targetAppId": "amazon",
                      "launchParam": ""
                    },
                    "type": "content",
                    "onShow": {
                      "method": "invoke",
                      "service": "amazon.service",
                      "contentId":
                          "detail?gti=amzn1.dv.gti.ef0b8570-d50b-46e9-8b97-6b65ff6b0f07&refMarker=dvm_liv_lgt_kr_bd_x_rec_pear"
                    },
                    "contentId": "af6b0feb-e587-41e8-b8c2-89aac6f8625a"
                  },
                  {
                    "vod": true,
                    "image": {
                      "url":
                          "https://images-fe.ssl-images-amazon.com/images/S/pv-target-images/4b24f67a17811b6171a693db91885e4cb86d5bad8d8758d30f6818e5b8dea81e._RI_TTW_._UR960,540_.png",
                      "width": 960,
                      "height": 540
                    },
                    "category": "Amazon Originals",
                    "titleText": "The Greatest Love Story Never Told",
                    "onClick": {
                      "contentId":
                          "detail?gti=amzn1.dv.gti.704e2a30-024e-4937-9fc5-a64b29d5077c&refMarker=dvm_liv_lgt_kr_bd_x_rec_pear",
                      "targetAppId": "amazon",
                      "launchParam": ""
                    },
                    "type": "content",
                    "onShow": {
                      "method": "invoke",
                      "service": "amazon.service",
                      "contentId":
                          "detail?gti=amzn1.dv.gti.704e2a30-024e-4937-9fc5-a64b29d5077c&refMarker=dvm_liv_lgt_kr_bd_x_rec_pear"
                    },
                    "contentId": "10933d02-83cc-4104-b1cb-9f7878241e26"
                  },
                  {
                    "vod": true,
                    "image": {
                      "url":
                          "https://images-fe.ssl-images-amazon.com/images/S/pv-target-images/7bbc04f2ac17b1d959b55e4f03f8bf84b701a3a4dc534c0512308da33b3869f8._RI_TTW_._UR960,540_.png",
                      "width": 960,
                      "height": 540
                    },
                    "category": "Amazon Originals2",
                    "titleText": "The Second Best Hospital in the Galaxy - Season 1",
                    "onClick": {
                      "contentId":
                          "detail?gti=amzn1.dv.gti.ff96e58b-f588-4473-b3a4-84e7e5a324fd&refMarker=dvm_liv_lgt_kr_bd_x_rec_pear",
                      "targetAppId": "amazon",
                      "launchParam": ""
                    },
                    "type": "content",
                    "onShow": {
                      "method": "invoke",
                      "service": "amazon.service",
                      "contentId":
                          "detail?gti=amzn1.dv.gti.ff96e58b-f588-4473-b3a4-84e7e5a324fd&refMarker=dvm_liv_lgt_kr_bd_x_rec_pear"
                    },
                    "contentId": "a7a829bb-d30e-46d6-9e32-198bc61008ce"
                  },
                  {
                    "vod": true,
                    "image": {
                      "url":
                          "https://images-fe.ssl-images-amazon.com/images/S/pv-target-images/dafb238a72d7a1eabd5370b0e2e225ed10e24e0a5c5ceaaa02a2325f5594f217._RI_TTW_._UR960,540_.png",
                      "width": 960,
                      "height": 540
                    },
                    "category": "Amazon Originals2",
                    "titleText": "Jenny Slate: Seasoned Professional",
                    "onClick": {
                      "contentId":
                          "detail?gti=amzn1.dv.gti.20371cdc-0426-4a1a-9aa7-bd894481d805&refMarker=dvm_liv_lgt_kr_bd_x_rec_pear",
                      "targetAppId": "amazon",
                      "launchParam": ""
                    },
                    "type": "content",
                    "onShow": {
                      "method": "invoke",
                      "service": "amazon.service",
                      "contentId":
                          "detail?gti=amzn1.dv.gti.20371cdc-0426-4a1a-9aa7-bd894481d805&refMarker=dvm_liv_lgt_kr_bd_x_rec_pear"
                    },
                    "contentId": "3dad62d6-6303-49ff-b122-138e30fbd0a4"
                  }
                ]
              },
              {
                "id": "prime.video",
                "contents": [
                  {
                    "category": "",
                    "contentId": "9c286fa4-242f-4b72-b8ef-5de1ecc164c1",
                    "onClick": {"contentId": "", "targetAppId": "cj.eandm", "launchParam": null},
                    "image": {
                      "url": "assets/compound_images/streaming/prime.png",
                      "width": 0,
                      "bgColor": "#19B0EA",
                      "height": 0
                    },
                    "promotionId": "",
                    "type": "title",
                    "image_4k": {"url": "", "width": 0, "bgColor": "", "height": 0},
                    "titleText": ""
                  },
                  {
                    "category": "인기 TV프로그램",
                    "contentId": "aa4890e3-894c-4e8d-93f9-679b14d784fe",
                    "onClick": {"contentId": "P001752535", "targetAppId": "cj.eandm", "launchParam": null},
                    "image": {
                      "url":
                          "https://image.tving.com/ntgs/contents/CTC/caip/CAIP0400/ko/20240124/0226/P001752535.jpg/dims/resize/900000000x250/crop/444x250",
                      "width": 444,
                      "bgColor": "",
                      "height": 250
                    },
                    "promotionId": "",
                    "type": "content",
                    "image_4k": {
                      "url":
                          "https://image.tving.com/ntgs/contents/CTC/caip/CAIP0400/ko/20240124/0226/P001752535.jpg/dims/resize/900000000x540/crop/960x540",
                      "width": 960,
                      "bgColor": "",
                      "height": 540
                    },
                    "titleText": "웨딩 임파서블"
                  },
                  {
                    "category": "인기 TV프로그램",
                    "contentId": "59c3f336-595f-457c-a804-405a85d1c3dc",
                    "onClick": {"contentId": "P001752235", "targetAppId": "cj.eandm", "launchParam": null},
                    "image": {
                      "url":
                          "https://image.tving.com/ntgs/contents/CTC/caip/CAIP0400/ko/20240117/1215/P001752235.jpg/dims/resize/900000000x250/crop/444x250",
                      "width": 444,
                      "bgColor": "",
                      "height": 250
                    },
                    "promotionId": "",
                    "type": "content",
                    "image_4k": {
                      "url":
                          "https://image.tving.com/ntgs/contents/CTC/caip/CAIP0400/ko/20240117/1215/P001752235.jpg/dims/resize/900000000x540/crop/960x540",
                      "width": 960,
                      "bgColor": "",
                      "height": 540
                    },
                    "titleText": "커플팰리스"
                  },
                  {
                    "category": "인기 TV프로그램",
                    "contentId": "863e711f-ac68-49f8-8064-3f3ea55cad3f",
                    "onClick": {"contentId": "P001752273", "targetAppId": "cj.eandm", "launchParam": null},
                    "image": {
                      "url":
                          "https://image.tving.com/ntgs/contents/CTC/caip/CAIP0400/ko/20240118/0750/P001752273.jpg/dims/resize/900000000x250/crop/444x250",
                      "width": 444,
                      "bgColor": "",
                      "height": 250
                    },
                    "promotionId": "",
                    "type": "content",
                    "image_4k": {
                      "url":
                          "https://image.tving.com/ntgs/contents/CTC/caip/CAIP0400/ko/20240118/0750/P001752273.jpg/dims/resize/900000000x540/crop/960x540",
                      "width": 960,
                      "bgColor": "",
                      "height": 540
                    },
                    "titleText": "텐트 밖은 유럽 남프랑스 편"
                  },
                  {
                    "category": "인기 TV프로그램",
                    "contentId": "4b0c5ece-80cc-4385-9b59-f06417bd6cf9",
                    "onClick": {"contentId": "P001749878", "targetAppId": "cj.eandm", "launchParam": null},
                    "image": {
                      "url":
                          "https://image.tving.com/ntgs/contents/CTC/caip/CAIP0400/ko/20231204/0755/P001749878.jpg/dims/resize/900000000x250/crop/444x250",
                      "width": 444,
                      "bgColor": "",
                      "height": 250
                    },
                    "promotionId": "",
                    "type": "content",
                    "image_4k": {
                      "url":
                          "https://image.tving.com/ntgs/contents/CTC/caip/CAIP0400/ko/20231204/0755/P001749878.jpg/dims/resize/900000000x540/crop/960x540",
                      "width": 960,
                      "bgColor": "",
                      "height": 540
                    },
                    "titleText": "환승연애3"
                  },
                  {
                    "category": "인기 TV프로그램",
                    "contentId": "b7737970-812b-498e-87c7-07faf5cd4229",
                    "onClick": {"contentId": "P001751658", "targetAppId": "cj.eandm", "launchParam": null},
                    "image": {
                      "url":
                          "https://image.tving.com/ntgs/contents/CTC/caip/CAIP0400/ko/20240104/0055/P001751658.jpg/dims/resize/900000000x250/crop/444x250",
                      "width": 444,
                      "bgColor": "",
                      "height": 250
                    },
                    "promotionId": "",
                    "type": "content",
                    "image_4k": {
                      "url":
                          "https://image.tving.com/ntgs/contents/CTC/caip/CAIP0400/ko/20240104/0055/P001751658.jpg/dims/resize/900000000x540/crop/960x540",
                      "width": 960,
                      "bgColor": "",
                      "height": 540
                    },
                    "titleText": "닥터슬럼프"
                  },
                  {
                    "category": "인기 TV프로그램",
                    "contentId": "a6deb844-98a4-4d03-866a-bfb1cf7a3a6c",
                    "onClick": {"contentId": "P001752505", "targetAppId": "cj.eandm", "launchParam": null},
                    "image": {
                      "url":
                          "https://image.tving.com/ntgs/contents/CTC/caip/CAIP0400/ko/20240202/0205/P001752505.jpg/dims/resize/900000000x250/crop/444x250",
                      "width": 444,
                      "bgColor": "",
                      "height": 250
                    },
                    "promotionId": "",
                    "type": "content",
                    "image_4k": {
                      "url":
                          "https://image.tving.com/ntgs/contents/CTC/caip/CAIP0400/ko/20240202/0205/P001752505.jpg/dims/resize/900000000x540/crop/960x540",
                      "width": 960,
                      "bgColor": "",
                      "height": 540
                    },
                    "titleText": "피라미드 게임"
                  }
                ]
              },
              {
                "id": "hulu",
                "contents": [
                  {
                    "category": "",
                    "contentId": "b0b2f1bd-3782-4770-89dd-555ce855df62",
                    "onClick": {"contentId": "", "targetAppId": "com.apple.appletv", "launchParam": null},
                    "image": {
                      "url": "assets/compound_images/streaming/hulu.png",
                      "width": 0,
                      "bgColor": "#000000",
                      "height": 0
                    },
                    "promotionId": "",
                    "type": "title",
                    "image_4k": {"url": "", "width": 0, "bgColor": "", "height": 0},
                    "titleText": ""
                  },
                  {
                    "category": "",
                    "contentId": "ea7900a2-ae7d-46ee-bd12-bad074efaccb",
                    "onClick": {
                      "contentId":
                          "https://tv.apple.com/kr/show/messis-world-cup-the-rise-of-a-legend/umc.cmc.6hpxli71tx1zy1mwz7tutj94h?ctx_proot=tahoma_herocollection",
                      "targetAppId": "com.apple.appletv",
                      "launchParam": null
                    },
                    "image": {
                      "url": "https://is1-ssl.mzstatic.com/image/thumb/dCbsG0u2kIrSyWBwYeAbXg/444x250.jpg",
                      "width": 444,
                      "bgColor": "",
                      "height": 250
                    },
                    "promotionId": "",
                    "type": "content",
                    "image_4k": {
                      "url": "https://is1-ssl.mzstatic.com/image/thumb/dCbsG0u2kIrSyWBwYeAbXg/960x540.jpg",
                      "width": 960,
                      "bgColor": "",
                      "height": 540
                    },
                    "titleText": "Messi’s World Cup: The Rise of a Legend"
                  },
                  {
                    "category": "",
                    "contentId": "2fa0985c-df4b-41f2-8d86-7c9964185f87",
                    "onClick": {
                      "contentId":
                          "https://tv.apple.com/kr/show/masters-of-the-air/umc.cmc.7bxcni0vwgll9kmicq738k5q2?ctx_proot=tahoma_herocollection",
                      "targetAppId": "com.apple.appletv",
                      "launchParam": null
                    },
                    "image": {
                      "url": "https://is1-ssl.mzstatic.com/image/thumb/PpNA7zp0nJJN23khb-XDUw/444x250.jpg",
                      "width": 444,
                      "bgColor": "",
                      "height": 250
                    },
                    "promotionId": "",
                    "type": "content",
                    "image_4k": {
                      "url": "https://is1-ssl.mzstatic.com/image/thumb/PpNA7zp0nJJN23khb-XDUw/960x540.jpg",
                      "width": 960,
                      "bgColor": "",
                      "height": 540
                    },
                    "titleText": "Masters of the Air"
                  },
                  {
                    "category": "",
                    "contentId": "f91e6e68-b9e7-4f1d-a05d-390617e06d07",
                    "onClick": {
                      "contentId":
                          "https://tv.apple.com/kr/show/monarch-legacy-of-monsters/umc.cmc.62l8x0ixrhyq3yaqa5y8yo7ew?ctx_proot=tahoma_herocollection",
                      "targetAppId": "com.apple.appletv",
                      "launchParam": null
                    },
                    "image": {
                      "url": "https://is1-ssl.mzstatic.com/image/thumb/xO0BO6SH877VpYQg4t5yjw/444x250.jpg",
                      "width": 444,
                      "bgColor": "",
                      "height": 250
                    },
                    "promotionId": "",
                    "type": "content",
                    "image_4k": {
                      "url": "https://is1-ssl.mzstatic.com/image/thumb/xO0BO6SH877VpYQg4t5yjw/960x540.jpg",
                      "width": 960,
                      "bgColor": "",
                      "height": 540
                    },
                    "titleText": "Monarch: Legacy of Monsters"
                  },
                  {
                    "category": "",
                    "contentId": "336efc8f-be6d-4ca9-a9b8-011fecdaf1be",
                    "onClick": {
                      "contentId":
                          "https://tv.apple.com/kr/movie/the-family-plan/umc.cmc.6o6y3wel2lez2tkdu2cv8dzd1?ctx_proot=tahoma_herocollection",
                      "targetAppId": "com.apple.appletv",
                      "launchParam": null
                    },
                    "image": {
                      "url": "https://is1-ssl.mzstatic.com/image/thumb/TSOA5piPKMvrafBK9hsMMw/444x250.jpg",
                      "width": 444,
                      "bgColor": "",
                      "height": 250
                    },
                    "promotionId": "",
                    "type": "content",
                    "image_4k": {
                      "url": "https://is1-ssl.mzstatic.com/image/thumb/TSOA5piPKMvrafBK9hsMMw/960x540.jpg",
                      "width": 960,
                      "bgColor": "",
                      "height": 540
                    },
                    "titleText": "The Family Plan"
                  },
                  {
                    "category": "",
                    "contentId": "eddec475-83f9-4582-8f3a-0344a2c878ad",
                    "onClick": {
                      "contentId":
                          "https://tv.apple.com/kr/show/slow-horses/umc.cmc.2szz3fdt71tl1ulnbp8utgq5o?ctx_proot=tahoma_herocollection",
                      "targetAppId": "com.apple.appletv",
                      "launchParam": null
                    },
                    "image": {
                      "url": "https://is1-ssl.mzstatic.com/image/thumb/COQLkYivbFicCWqgJMjuUw/444x250.jpg",
                      "width": 444,
                      "bgColor": "",
                      "height": 250
                    },
                    "promotionId": "",
                    "type": "content",
                    "image_4k": {
                      "url": "https://is1-ssl.mzstatic.com/image/thumb/COQLkYivbFicCWqgJMjuUw/960x540.jpg",
                      "width": 960,
                      "bgColor": "",
                      "height": 540
                    },
                    "titleText": "Slow Horses"
                  },
                  {
                    "category": "",
                    "contentId": "27c6fa09-71db-4fb7-9afa-4eca8479ddb1",
                    "onClick": {
                      "contentId":
                          "https://tv.apple.com/kr/show/messi-meets-america/umc.cmc.es6c1ptzxayqb3njj21diwhm?ctx_proot=tahoma_herocollection",
                      "targetAppId": "com.apple.appletv",
                      "launchParam": null
                    },
                    "image": {
                      "url": "https://is1-ssl.mzstatic.com/image/thumb/j5ToggKmBu8ktNLlr1E7pw/444x250.jpg",
                      "width": 444,
                      "bgColor": "",
                      "height": 250
                    },
                    "promotionId": "",
                    "type": "content",
                    "image_4k": {
                      "url": "https://is1-ssl.mzstatic.com/image/thumb/j5ToggKmBu8ktNLlr1E7pw/960x540.jpg",
                      "width": 960,
                      "bgColor": "",
                      "height": 540
                    },
                    "titleText": "Messi Meets America"
                  }
                ]
              },
              {
                "id": "disney",
                "contents": [
                  {
                    "category": "",
                    "contentId": "6334c429-5e77-4005-88bf-acd36d97a562",
                    "onClick": {"contentId": "", "targetAppId": "com.disney.disneyplus-prod", "launchParam": null},
                    "image": {
                      "url": "assets/compound_images/streaming/Disney.png",
                      "width": 0,
                      "bgColor": "#101C50",
                      "height": 0
                    },
                    "promotionId": "",
                    "type": "title",
                    "image_4k": {"url": "", "width": 0, "bgColor": "", "height": 0},
                    "titleText": ""
                  },
                  {
                    "category": "",
                    "contentId": "b4f8aa74-cd15-4257-bf4d-287c29a80077",
                    "onClick": {
                      "contentId":
                          "distributionPartner=lg&programType=movie&contentId=652684cc-97dd-46d1-910e-86f0a7e15855&page=movie_details&id=1tmc3nPw04S2&type=movie&contentType=Full",
                      "targetAppId": "com.disney.disneyplus-prod",
                      "launchParam": null
                    },
                    "image": {
                      "url":
                          "https://prod-ripcut-delivery.disney-plus.net/v1/disney/disco/general/FB016B8C1D3308F7FD9797D0BEB0A3ED81450F7354BD581C78D3115CCBABDB19/scale?width=444",
                      "width": 444,
                      "bgColor": "",
                      "height": 250
                    },
                    "promotionId": "",
                    "type": "content",
                    "image_4k": {
                      "url":
                          "https://prod-ripcut-delivery.disney-plus.net/v1/disney/disco/general/FB016B8C1D3308F7FD9797D0BEB0A3ED81450F7354BD581C78D3115CCBABDB19/scale?width=960",
                      "width": 960,
                      "bgColor": "",
                      "height": 540
                    },
                    "titleText": "가디언즈 오브 갤럭시: Volume 3"
                  },
                  {
                    "category": "",
                    "contentId": "02839b1d-80a0-4e94-a80c-f50c14e7b55a",
                    "onClick": {
                      "contentId":
                          "distributionPartner=lg&programType=series&contentId=1f318d27-e335-4046-aebb-288e39a5a6e6&page=series_details&id=5f3Gi2h8PfIT&type=series&contentType=Full",
                      "targetAppId": "com.disney.disneyplus-prod",
                      "launchParam": null
                    },
                    "image": {
                      "url":
                          "https://prod-ripcut-delivery.disney-plus.net/v1/disney/disco/general/9A45A45453B65B1E5F33D9CCE0275C6DFEC9D4E418BFE6EBC1DD5DCDFF45AD0B/scale?width=444",
                      "width": 444,
                      "bgColor": "",
                      "height": 250
                    },
                    "promotionId": "",
                    "type": "content",
                    "image_4k": {
                      "url":
                          "https://prod-ripcut-delivery.disney-plus.net/v1/disney/disco/general/9A45A45453B65B1E5F33D9CCE0275C6DFEC9D4E418BFE6EBC1DD5DCDFF45AD0B/scale?width=960",
                      "width": 960,
                      "bgColor": "",
                      "height": 540
                    },
                    "titleText": "형사록"
                  },
                  {
                    "category": "",
                    "contentId": "58dabca9-6da9-4f15-8b43-f25ce44f02cc",
                    "onClick": {
                      "contentId":
                          "distributionPartner=lg&programType=series&contentId=46996efb-3074-4bcd-bddc-1c300169fcb2&page=series_details&id=3iHQtD1BDpgN&type=series&contentType=Full",
                      "targetAppId": "com.disney.disneyplus-prod",
                      "launchParam": null
                    },
                    "image": {
                      "url":
                          "https://prod-ripcut-delivery.disney-plus.net/v1/disney/disco/general/A424BFFB6E29888254071F6FC093C19B4045782E9641A232BD5580EF8B18B002/compose?label=disneyplusoriginal_178_hd&width=444",
                      "width": 444,
                      "bgColor": "",
                      "height": 250
                    },
                    "promotionId": "",
                    "type": "content",
                    "image_4k": {
                      "url":
                          "https://prod-ripcut-delivery.disney-plus.net/v1/disney/disco/general/A424BFFB6E29888254071F6FC093C19B4045782E9641A232BD5580EF8B18B002/compose?label=disneyplusoriginal_178_hd&width=960",
                      "width": 960,
                      "bgColor": "",
                      "height": 540
                    },
                    "titleText": "시크릿 인베이젼"
                  },
                  {
                    "category": "",
                    "contentId": "ec4dd4f8-e3a6-4ce3-a4df-7d29bca0342b",
                    "onClick": {
                      "contentId":
                          "distributionPartner=lg&programType=series&contentId=a22b7315-fbf0-44fa-96f2-a54a7d41254e&page=series_details&id=4HOazYzuiwLK&type=series&contentType=Full",
                      "targetAppId": "com.disney.disneyplus-prod",
                      "launchParam": null
                    },
                    "image": {
                      "url":
                          "https://prod-ripcut-delivery.disney-plus.net/v1/disney/disco/general/D7F10299CADDFBF24363C4C30A4FC1311C5E2A36A6A9F99350D77660438A94D0/scale?width=444",
                      "width": 444,
                      "bgColor": "",
                      "height": 250
                    },
                    "promotionId": "",
                    "type": "content",
                    "image_4k": {
                      "url":
                          "https://prod-ripcut-delivery.disney-plus.net/v1/disney/disco/general/D7F10299CADDFBF24363C4C30A4FC1311C5E2A36A6A9F99350D77660438A94D0/scale?width=960",
                      "width": 960,
                      "bgColor": "",
                      "height": 540
                    },
                    "titleText": "더 존: 버텨야 산다"
                  },
                  {
                    "category": "",
                    "contentId": "9ab6b7b7-38c2-47d1-a8b6-16f39d1e8d0b",
                    "onClick": {
                      "contentId":
                          "distributionPartner=lg&programType=movie&contentId=aa1ff15e-51a5-487a-be02-0d8657b28da3&page=movie_details&id=3E6HcpnDvEVS&type=movie&contentType=Full",
                      "targetAppId": "com.disney.disneyplus-prod",
                      "launchParam": null
                    },
                    "image": {
                      "url":
                          "https://prod-ripcut-delivery.disney-plus.net/v1/disney/disco/general/40CCB814C2D85C13EC281C9949104C153B56A0D7841E612D98154C9669D96142/compose?label=disneyplusoriginal_178_hd&width=444",
                      "width": 444,
                      "bgColor": "",
                      "height": 250
                    },
                    "promotionId": "",
                    "type": "content",
                    "image_4k": {
                      "url":
                          "https://prod-ripcut-delivery.disney-plus.net/v1/disney/disco/general/40CCB814C2D85C13EC281C9949104C153B56A0D7841E612D98154C9669D96142/compose?label=disneyplusoriginal_178_hd&width=960",
                      "width": 960,
                      "bgColor": "",
                      "height": 540
                    },
                    "titleText": "TOMORROW X TOGETHER: Our Lost Summer"
                  },
                  {
                    "category": "",
                    "contentId": "16a61fca-2ae3-4b53-b168-6fb4d9b64d10",
                    "onClick": {
                      "contentId":
                          "distributionPartner=lg&programType=series&contentId=b2ec5d18-b828-4ea7-9752-8ebf31d57ecb&page=series_details&id=52m6nx7HoP5F&type=series&contentType=Full",
                      "targetAppId": "com.disney.disneyplus-prod",
                      "launchParam": null
                    },
                    "image": {
                      "url":
                          "https://prod-ripcut-delivery.disney-plus.net/v1/disney/disco/general/B33D9F04E0F2CA5052F9D636A80989255600D3FA317042D3688BF33127B11ECB/scale?width=444",
                      "width": 444,
                      "bgColor": "",
                      "height": 250
                    },
                    "promotionId": "",
                    "type": "content",
                    "image_4k": {
                      "url":
                          "https://prod-ripcut-delivery.disney-plus.net/v1/disney/disco/general/B33D9F04E0F2CA5052F9D636A80989255600D3FA317042D3688BF33127B11ECB/scale?width=960",
                      "width": 960,
                      "bgColor": "",
                      "height": 540
                    },
                    "titleText": "더 베어"
                  },
                  {
                    "category": "",
                    "contentId": "5b254667-eb86-40d0-838c-7f0aa9d59990",
                    "onClick": {
                      "contentId":
                          "distributionPartner=lg&programType=movie&contentId=9f87bdb0-9450-4d6e-9cd5-3752b95853c6&page=movie_details&id=6hlsDJnhiU30&type=movie&contentType=Full",
                      "targetAppId": "com.disney.disneyplus-prod",
                      "launchParam": null
                    },
                    "image": {
                      "url":
                          "https://prod-ripcut-delivery.disney-plus.net/v1/disney/disco/general/DAC5FED6359FFE2580A44F861E59B93696834D724135DA5106B44EE06FB43545/scale?width=444",
                      "width": 444,
                      "bgColor": "",
                      "height": 250
                    },
                    "promotionId": "",
                    "type": "content",
                    "image_4k": {
                      "url":
                          "https://prod-ripcut-delivery.disney-plus.net/v1/disney/disco/general/DAC5FED6359FFE2580A44F861E59B93696834D724135DA5106B44EE06FB43545/scale?width=960",
                      "width": 960,
                      "bgColor": "",
                      "height": 540
                    },
                    "titleText": "아바타: 물의 길"
                  }
                ]
              }
            ],
            tabList: [
              {'title': 'YouTube', 'id': 'youtube', 'focus_id': 'focus_id_1'},
              {'title': 'Amazone', 'id': 'amazone', 'focus_id': 'focus_id_2'},
              {'title': 'prime video', 'id': 'prime.video', 'focus_id': 'focus_id_3'},
              {'title': 'hulu', 'id': 'hulu', 'focus_id': 'focus_id_4'},
              {'title': 'Disney', 'id': 'disney', 'focus_id': 'focus_id_5'}
            ],
            width: 2688.0,
            height: 840.0,
            spaceTabCategory: 42.0,
            streamingCategoryTitleHeight: 57.0,
            spaceCategoryContents: 33.0,
            streamingContentsHeight: 432.0,
            hoveredStreamingContentsHeight: 498.0,
            title: '''''',
            streamingHeaderheight: 63.0,
            streamingHeaderPaddingLeft: 30.0,
            streamingHeaderPaddingTitleBottom: 39.0,
            streamingHeaderPaddingTitleTop: 0.0,
            streamingHeaderFontSize: 54.0,
            streamingHeaderFontWeight: FontWeight.w600,
            streamingHeaderFontStyle: FontStyle.normal,
            streamingHeaderFontColor: Color(0xFFFFFFFF),
            streamingHeaderFontOpacity: 1.0,
            streamingHeaderLabelSemantic: '''''',
            isRtl: false,
            streamingHeaderAnimation: true,
            streamingHeaderShelfTitleAnimOffset: 10.0,
            streamingTabGroupLabel: '''Tab_streaming''',
            streamingTabHeight: 120.0,
            streamingTabWidth: 588.0,
            streamingTabListStartMargin: 42.0,
            tabTitleFontSize: 48.0,
            tabButtonHeight: 90.0,
            tabButtonWidth: 558.0,
            tabButtonTextHeight: 57.0,
            tabButtonTextWidth: 504.0,
            tabButtonBorderSize: 4.0,
            streamingTabListBgColor: Color(0xFF2D3136),
            streamingTabListBgColorOpacity: 1.0,
            streamingTabListBorderColor: Color(0xFFAAAAAA),
            streamingTabListBorderColorOpacity: 1.0,
            tabButtonFontColor: Color(0xFFE6E6E6),
            tabButtonBorderColor: Color(0x00000000),
            tabButtonBgColor: Color(0x00000000),
            tabButtonHoveredBgColor: Color(0xFFE6E6E6),
            tabButtonHoveredBgColorOpacity: 1.0,
            tabButtonHoveredBorderColor: Color(0x00000000),
            tabButtonHoveredFontColor: Color(0xFF4C5059),
            tabButtonSelectedFontColor: Color(0xFFE6E6E6),
            tabButtonSelectedBorderColor: Color(0xFFAAAAAA),
            tabButtonSelectedBgColor: Color(0x00000000),
            hoveredTabButtonRadius: 18.0,
            is4K: true,
            streamingContentsChildMargin: 48.0,
            streamingContentsAnimatedScale: 1.15,
            categoryTitleTopPadding: 0.0,
            categoryTitleBottomPadding: 33.0,
            categoryTitleLeftPadding: 0.0,
            streamingCategoryTitleFontSize: 48.0,
            subTitleText: '''00h 00m''',
            focuseContentsWidth: 882.0,
            maskImageHeight: 126.0,
            maskImage: '''assets/compound_images/streaming/mask.png''',
            streamingContentBorderSize: 2.0,
            streamingContentBorderColor: Color(0xFFFFFFFF),
            borderOpacity: 0.3,
            streamingContentHoveredBorderColor: Color(0xFFE6E6E6),
            streamingTitleTopMargin: 42.0,
            streamingTitleHeight: 57.0,
            streamingTitleFontSize: 48.0,
            streamingContentsHoverFontColor: Color(0xFFE6E6E6),
            streamingTitlePadding: 30.0,
            posTopOfTitle: 405.0,
            posLeftOfTitle: 60.0,
            posBottomOfTitle: 36.0,
            posTopOfTitleVod: 345.0,
            posLeftOfTitleVod: 24.0,
            posBottomOfTitleVod: 96.0,
            posTopOfSubtitleVod: 414.0,
            posLeftOfSubTitleVod: 24.0,
            posBottomOfSubTitleVod: 42.0,
            iconImageSize: 224.0,
            iconSize: 252.0,
            iconImageBgColor: Color(0xFF333333),
            focusedIconImageSize: 268.44,
            focusedIconSize: 302.0,
            iconImageRadius: 18.51,
            iconFocusedImage: '''assets/compound_images/streaming/Bitmap.png''',
            iconFocusedImageWidth: 120.0,
            iconFocusedImageHeight: 170.0,
            iconFocusedImagLeftPos: 280.0,
            iconFocusedImagTopPos: 266.0)),
    MapEntry(
        '''Channel''',
        ContentShelfListView(
            headerTitle: '''Channels''',
            childMargin: 36,
            itemBuilder: (BuildContext childContext, int index, bool isFocus) {
              return ContentShelfChannelItem(
                channelName: 'Channel Name',
                channelNumber: 'Channel Number',
                title: 'Common Channel',
                isFocus: isFocus,
                broadcastUtcTime: DateTime.now(),
                startTime: DateTime.now().subtract(const Duration(minutes: 30)),
                endTime: DateTime.now().add(const Duration(minutes: 90)),
              );
            },
            itemCount: 8,
            padding: const EdgeInsets.symmetric(horizontal: 48),
            shelfId: '''''',
            width: 2688.0)),
    MapEntry(
        '''Editor's Pick''',
        ContentShelfListView(
            headerTitle: '''Editors Pick''',
            childMargin: 36,
            itemBuilder: (BuildContext childContext, int index, bool isFocus) {
              return ContentShelfEditorsPickItem(
                imgUrl: 'assets/compound_images/contentshelf/editorspick_default.webp',
                isFocus: isFocus,
                height: 400,
                title: 'Change Styles(width, height)',
                width: 600,
              );
            },
            itemCount: 8,
            padding: const EdgeInsets.symmetric(horizontal: 48),
            shelfId: '''''',
            width: 2688.0))
  ];

  const ShelvesContentProvider();
}
