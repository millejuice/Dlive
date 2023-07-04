import 'package:dlive/utils/host_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileCharacter2Screen extends StatefulWidget {
  const ProfileCharacter2Screen({super.key});

  @override
  State<ProfileCharacter2Screen> createState() =>
      _ProfileCharacter2ScreenState();
}

class _ProfileCharacter2ScreenState extends State<ProfileCharacter2Screen> {
  late HostUtil hostUtil = HostUtil();

  @override
  Widget build(BuildContext context) {
    final hostProvider = Provider.of<HostProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 812 * 82,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo_text_black.png',
                height: MediaQuery.of(context).size.height / 812 * 24,
                width: MediaQuery.of(context).size.width / 375 * 68,
              ),
              Text(
                '에 오신 ${Provider.of<HostProvider>(context).name}님,',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const Text(
            '즐거운 드라이브 하세요',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 812 * 48,
          ),
          Image.asset(
            Provider.of<HostProvider>(context).character,
            width: MediaQuery.of(context).size.width / 375 * 279,
            height: MediaQuery.of(context).size.height / 812 * 280,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 812 * 227,
          ),
          GestureDetector(
            child: Container(
              height: MediaQuery.of(context).size.height / 812 * 46,
              width: MediaQuery.of(context).size.width / 375 * 249,
              decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Center(
                child: Text(
                  '시작하기',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            onTap: () {
              hostUtil.addHost(hostProvider.name, hostProvider.email,
                  hostProvider.character);

              Navigator.pushNamed(context, '/profile');
            },
          ),
        ]),
      ),
    );
  }
}
