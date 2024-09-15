import 'package:fast8_techtest/blocs/bottom_nav_cubit.dart';
import 'package:fast8_techtest/blocs/explore_wellness_cubit.dart';
import 'package:fast8_techtest/blocs/home_cubit.dart';
import 'package:fast8_techtest/global_variable.dart';
import 'package:fast8_techtest/screens/profile_screen.dart';
import 'package:fast8_techtest/themeColor.dart';
import 'package:fast8_techtest/widgets/menu_button.dart';
import 'package:fast8_techtest/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<String> items = const [
    "Terpopuler",
    "A to Z",
    "Z to A",
    "Termurah"
  ];

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
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ProfileScreen(),
              ));
            },
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 20,
              child: Text(
                "M",
                style: headerBold.copyWith(fontSize: 22, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      backgroundColor: Theme.of(context).primaryOrange,
      body: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
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
                                style:
                                    body.copyWith(color: Colors.grey.shade500),
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
                          'Explore Wellness',
                          style: headerBold,
                        ),
                        Container(
                            width: 120,
                            decoration: BoxDecoration(
                              color: Theme.of(context).buttonBackground,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            alignment: Alignment.center,
                            child: BlocBuilder<HomeCubit, HomeState>(
                              builder: (context, state) {
                                return DropdownButton(
                                  dropdownColor:
                                      Theme.of(context).buttonBackground,
                                  value: state.selectedFilter,
                                  isExpanded: true,
                                  isDense: true,
                                  style:
                                      subHeader.copyWith(color: Colors.black),
                                  icon: const Icon(
                                      Icons.keyboard_arrow_down_rounded),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 2),
                                  selectedItemBuilder: (context) {
                                    return items.map((e) => Text(e)).toList();
                                  },
                                  items: items
                                      .map(
                                        (e) => DropdownMenuItem(
                                          value: e,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(e),
                                              if (state.selectedFilter == e)
                                                Icon(
                                                  Icons.circle,
                                                  size: 10,
                                                  color: Theme.of(context)
                                                      .primaryOrange,
                                                )
                                            ],
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (value) {
                                    if (value == null) {
                                      return;
                                    }
                                    context
                                        .read<HomeCubit>()
                                        .setFilterWellness(value!);
                                  },
                                );
                              },
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BlocBuilder<ExploreWellnessCubit, ExploreWellnessState>(
                      builder: (context, state) {
                        return GridView.count(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          mainAxisSpacing: 30,
                          childAspectRatio: (1 / .8),
                          children: state.listProduct
                              .map((e) => ProductCard(
                                    imagePath: e.imgUrl,
                                    desc: e.desc,
                                    price: double.parse(e.price),
                                    discountPercent:
                                        double.tryParse(e.disc ?? "0xFF"),
                                  ))
                              .toList(),
                        );
                      },
                    ),
                    SizedBox(
                      height: getHeight(context, 10),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(child: BlocBuilder<BottomNavCubit, BottomNavState>(
            builder: (context, state) {
              return DraggableScrollableSheet(
                expand: true,
                minChildSize: 0.14,
                initialChildSize: 0.14,
                maxChildSize: 0.44,
                snap: true,
                controller:
                    context.read<BottomNavCubit>().bottomSheetController,
                builder: (context, scrollController) {
                  return Stack(
                    alignment: Alignment.topCenter,
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        top: 0,
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.black.withOpacity(0.2),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 15,
                        child: Container(
                          height: 60,
                          width: getWidth(context),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.2),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50)),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 2,
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.white,
                                  Colors.white,
                                  Colors.transparent
                                ]),
                          ),
                          alignment: Alignment.topCenter,
                        ),
                      ),
                      Positioned(
                        top: 17,
                        right: 0,
                        left: 0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                stops: [
                                  0.7,
                                  1.2
                                ],
                                colors: [
                                  Colors.white,
                                  Colors.blueGrey.shade100
                                ]),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50)),
                          ),
                          child: Column(
                            children: [
                              GridView.count(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 40),
                                controller: scrollController,
                                shrinkWrap: true,
                                crossAxisCount: 3,
                                crossAxisSpacing: 40,
                                mainAxisSpacing: 10,
                                childAspectRatio: 1,
                                children: [
                                  BottomNavButton(
                                    iconPath: "assets/icons/home.svg",
                                    label: 'Beranda',
                                    selected: state.activeIdx == 0,
                                    onTap: () {
                                      print(1);
                                      context.read<BottomNavCubit>().goTo(0);
                                    },
                                  ),
                                  BottomNavButton(
                                    iconPath: "assets/icons/search.svg",
                                    label: 'Cari',
                                    selected: state.activeIdx == 1,
                                    onTap: () {
                                      print(2);
                                      context.read<BottomNavCubit>().goTo(1);
                                    },
                                  ),
                                  BottomNavButton(
                                    iconPath: "assets/icons/cart.svg",
                                    label: 'Keranjang',
                                    selected: state.activeIdx == 2,
                                    notif: 0,
                                  ),
                                  BottomNavButton(
                                    iconPath: "assets/icons/home.svg",
                                    label: 'Daftar Transaksi',
                                    selected: state.activeIdx == 3,
                                    notif: 0,
                                  ),
                                  BottomNavButton(
                                    iconPath: "assets/icons/perencanaan.svg",
                                    label: 'Voucher Saya',
                                    selected: state.activeIdx == 3,
                                  ),
                                  BottomNavButton(
                                    iconPath: "assets/icons/loc.svg",
                                    label: 'Alamat Pengiriman',
                                    selected: state.activeIdx == 3,
                                  ),
                                  BottomNavButton(
                                    iconPath: "assets/icons/urun.svg",
                                    label: 'Daftar Teman',
                                    selected: state.activeIdx == 3,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: getHeight(context, 5),
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        child: InkWell(
                          onTap: () {
                            context.read<BottomNavCubit>().toggleDetail();
                          },
                          child: Icon(
                            state.isDetail
                                ? Icons.keyboard_arrow_down_rounded
                                : Icons.keyboard_arrow_up_rounded,
                            size: 36,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ))
        ],
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
          child: GridView.count(
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 4,
            shrinkWrap: true,
            children: [
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
          child: GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              HomeMenuButton(
                iconPath: "assets/icons/hobi.svg",
                iconColor: Colors.blue,
                label: "Hobi",
              ),
              HomeMenuButton(
                iconPath: "assets/icons/merchant.svg",
                iconColor: Colors.lightBlueAccent,
                label: "Merchandise",
              ),
              HomeMenuButton(
                iconPath: "assets/icons/sehat.svg",
                iconColor: Colors.redAccent,
                label: "Gaya Hidup Sehat",
              ),
              HomeMenuButton(
                iconPath: "assets/icons/konsul.svg",
                iconColor: Colors.blueGrey,
                label: "Konseling & Rohani",
              ),
              HomeMenuButton(
                iconPath: "assets/icons/self_dev.svg",
                iconColor: Colors.deepPurpleAccent,
                label: "Self Development",
              ),
              HomeMenuButton(
                iconPath: "assets/icons/perencanaan.svg",
                iconColor: Colors.green,
                label: "Perencanaan Keuangan",
              ),
              HomeMenuButton(
                iconPath: "assets/icons/medis.svg",
                iconColor: Colors.red,
                label: "Konsultasi Medis",
              ),
              HomeMenuButton(
                iconPath: "assets/icons/more.svg",
                iconColor: Colors.black,
                label: "Lihat Semua",
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class BottomNavButton extends StatelessWidget {
  final String iconPath;
  final String label;
  final bool selected;
  final Function()? onTap;
  final int? notif;
  const BottomNavButton({
    super.key,
    required this.iconPath,
    required this.label,
    this.onTap,
    this.notif,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          notif == null
              ? SvgPicture.asset(
                  iconPath,
                  height: 30,
                  colorFilter: ColorFilter.mode(
                      selected ? Theme.of(context).primaryOrange : Colors.black,
                      BlendMode.srcIn),
                )
              : Badge.count(
                  count: notif!,
                  child: SvgPicture.asset(
                    iconPath,
                    height: 30,
                    colorFilter: ColorFilter.mode(
                        selected
                            ? Theme.of(context).primaryOrange
                            : Colors.black,
                        BlendMode.srcIn),
                  ),
                ),
          const SizedBox(
            height: 6,
          ),
          Text(
            label,
            textAlign: TextAlign.center,
            style: body.copyWith(
              color: selected ? Theme.of(context).primaryOrange : Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
