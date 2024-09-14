import 'package:fast8_techtest/global_variable.dart';
import 'package:fast8_techtest/themeColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        toolbarHeight: 60,
        titleSpacing: 20,
        backgroundColor: Theme.of(context).primaryOrange,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Selamat Malam",
              style: subHeader.copyWith(color: Colors.white),
            ),
            Text(
              "Muhammad Iqbal",
              style: headerBold.copyWith(color: Colors.white),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Badge.count(
              backgroundColor: Colors.red,
              count: 0,
              textColor: Colors.white,
              child: SvgPicture.asset(
                "assets/icons/notif.svg",
                height: 26,
                colorFilter:
                    const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ),
          ),
          CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 20,
            child: Text(
              "M",
              style: headerBold.copyWith(fontSize: 22, color: Colors.white),
            ),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      backgroundColor: Theme.of(context).primaryOrange,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: getHeight(context)),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(35))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 48,
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(50)),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 46,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryOrange,
                              borderRadius: BorderRadius.circular(50)),
                          child: Text(
                            "Payuung Pribadi",
                            style: body.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Expanded(
                        child: Container(
                          height: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(50)),
                          child: Text(
                            "Payuung Karyawan",
                            style: body.copyWith(color: Colors.grey.shade500),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                _produkKeuangan(context),
                const SizedBox(
                  height: 15,
                ),
                _kategoriPilihan(context),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Kategori Pilihan',
                      style: headerBold,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 8),
                      decoration: BoxDecoration(
                        color: Theme.of(context).buttonBackground,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Terpopuler",
                            style: subHeader,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Icon(Icons.keyboard_arrow_down_rounded)
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 180,
                  color: Colors.greenAccent,
                ),
                Container(
                  height: 980,
                  color: Colors.lightGreen,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column _produkKeuangan(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Produk Keuangan',
          style: headerBold,
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: getWidth(context),
          alignment: Alignment.center,
          child: Wrap(
            spacing: getWidth(context, 5),
            crossAxisAlignment: WrapCrossAlignment.start,
            children: const [
              HomeMenuButton(
                iconPath: "assets/icons/urun.svg",
                iconColor: Colors.brown,
                label: "Urun",
                isNew: true,
              ),
              HomeMenuButton(
                iconPath: "assets/icons/haji.svg",
                iconColor: Colors.brown,
                label: "Pembiayaan Porsi Haji",
              ),
              HomeMenuButton(
                iconPath: "assets/icons/fin_checkup.svg",
                iconColor: Colors.yellow,
                label: "Financial Check Up",
              ),
              HomeMenuButton(
                iconPath: "assets/icons/car_crash.svg",
                iconColor: Colors.blueGrey,
                label: "Asuransi Mobil",
              ),
              HomeMenuButton(
                iconPath: "assets/icons/house_burn.svg",
                iconColor: Colors.red,
                label: "Asuransi Rumah",
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column _kategoriPilihan(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Kategori Pilihan',
              style: headerBold,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              decoration: BoxDecoration(
                color: Theme.of(context).buttonBackground,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Wishlist",
                    style: subHeader,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    height: 22,
                    width: 22,
                    alignment: Alignment.center,
                    padding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryOrange,
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      "0",
                      style: body.copyWith(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: getWidth(context),
          alignment: Alignment.center,
          child: Wrap(
            spacing: getWidth(context, 5),
            crossAxisAlignment: WrapCrossAlignment.start,
            children: const [
              HomeMenuButton(
                iconPath: "assets/icons/urun.svg",
                iconColor: Colors.brown,
                label: "Hobi",
              ),
              HomeMenuButton(
                iconPath: "assets/icons/haji.svg",
                iconColor: Colors.brown,
                label: "Merchandise",
              ),
              HomeMenuButton(
                iconPath: "assets/icons/fin_checkup.svg",
                iconColor: Colors.yellow,
                label: "Gaya Hidup Sehat",
              ),
              HomeMenuButton(
                iconPath: "assets/icons/car_crash.svg",
                iconColor: Colors.blueGrey,
                label: "Konseling & Rohani",
              ),
              HomeMenuButton(
                iconPath: "assets/icons/house_burn.svg",
                iconColor: Colors.red,
                label: "Self Development",
              ),
              HomeMenuButton(
                iconPath: "assets/icons/house_burn.svg",
                iconColor: Colors.red,
                label: "Perencanaan Keuangan",
              ),
              HomeMenuButton(
                iconPath: "assets/icons/house_burn.svg",
                iconColor: Colors.red,
                label: "Konsultasi Medis",
              ),
              HomeMenuButton(
                iconPath: "assets/icons/house_burn.svg",
                iconColor: Colors.red,
                label: "Lihat Semua",
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class HomeMenuButton extends StatelessWidget {
  final String iconPath;
  final Color iconColor;
  final String label;
  final bool isNew;
  const HomeMenuButton({
    super.key,
    required this.iconPath,
    required this.iconColor,
    required this.label,
    this.isNew = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Badge(
          isLabelVisible: isNew,
          label: Text(
            "New",
            style: body.copyWith(fontSize: 9),
          ),
          child: SvgPicture.asset(
            iconPath,
            height: 28,
            colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
          ),
        ),
        SizedBox(
          height: 2,
        ),
        SizedBox(
          width: 74,
          child: Text(
            label,
            style: body,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
