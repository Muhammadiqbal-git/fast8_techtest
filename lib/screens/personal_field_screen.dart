import 'package:fast8_techtest/blocs/personal_info_cubit.dart';
import 'package:fast8_techtest/global_variable.dart';
import 'package:fast8_techtest/themeColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class PersonalFieldScreen extends StatelessWidget {
  const PersonalFieldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonalInfoCubit, PersonalInfoState>(
      builder: (context, state) {
        return Stack(
          children: [
            Scaffold(
              backgroundColor: Colors.blueGrey.shade50,
              appBar: AppBar(
                backgroundColor: Colors.blueGrey.shade50,
                elevation: 0,
                scrolledUnderElevation: 0,
                leading: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Icon(Icons.keyboard_arrow_left_rounded)),
                ),
                title: const Text(
                  "Informasi Pribadi",
                  style: subHeaderBold,
                ),
                centerTitle: true,
              ),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(children: [
                  BlocConsumer<PersonalInfoCubit, PersonalInfoState>(
                    listener: (context, state) {
                      if (state is PersonalInfoDoneSave) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Theme.of(context).primaryOrange,
                            shape: BorderDirectional(
                                top: BorderSide(
                                    color: Colors.black.withOpacity(0.4),
                                    width: 2)),
                            content: Text(
                              "Done Saving",
                              style: headerBold.copyWith(color: Colors.white),
                            ),
                            duration: Duration(milliseconds: 900),
                          ),
                        );
                        Navigator.of(context).pop();
                      }
                    },
                    builder: (context, state) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Stack(
                                clipBehavior: Clip.none,
                                alignment: Alignment.topCenter,
                                children: [
                                  InkWell(
                                    borderRadius: BorderRadius.circular(50),
                                    onTap: () {
                                      context
                                          .read<PersonalInfoCubit>()
                                          .changeProcessIdx(0);
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: state.processIdx >= 0
                                          ? Theme.of(context).primaryOrange
                                          : Theme.of(context)
                                              .primaryOrange
                                              .withOpacity(0.4),
                                      radius: 26,
                                      child: Text(
                                        "1",
                                        style: subHeader.copyWith(
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: -24,
                                    child: Text(
                                      "Biodata Diri",
                                      style: subHeader.copyWith(
                                          color:
                                              Theme.of(context).primaryOrange),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                height: 4,
                                width: getWidth(context, 12),
                                color: state.processIdx >= 0
                                    ? Theme.of(context).primaryOrange
                                    : Theme.of(context)
                                        .primaryOrange
                                        .withOpacity(0.4),
                              ),
                              Container(
                                height: 4,
                                width: getWidth(context, 12),
                                color: state.processIdx >= 1
                                    ? Theme.of(context).primaryOrange
                                    : Theme.of(context)
                                        .primaryOrange
                                        .withOpacity(0.4),
                              ),
                              Stack(
                                clipBehavior: Clip.none,
                                alignment: Alignment.topCenter,
                                children: [
                                  InkWell(
                                    borderRadius: BorderRadius.circular(50),
                                    onTap: () {
                                      context
                                          .read<PersonalInfoCubit>()
                                          .changeProcessIdx(1);
                                    },
                                    child: CircleAvatar(
                                      radius: 26,
                                      backgroundColor: state.processIdx >= 1
                                          ? Theme.of(context).primaryOrange
                                          : Theme.of(context)
                                              .primaryOrange
                                              .withOpacity(0.4),
                                      child: Text(
                                        "2",
                                        style: subHeader.copyWith(
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: -44,
                                    child: SizedBox(
                                      width: 80,
                                      child: Text(
                                        "Alamat Pribadi",
                                        textAlign: TextAlign.center,
                                        style: subHeader.copyWith(
                                            color: Theme.of(context)
                                                .primaryOrange),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                height: 4,
                                width: getWidth(context, 12),
                                color: state.processIdx >= 1
                                    ? Theme.of(context).primaryOrange
                                    : Theme.of(context)
                                        .primaryOrange
                                        .withOpacity(0.4),
                              ),
                              Container(
                                height: 4,
                                width: getWidth(context, 12),
                                color: state.processIdx >= 2
                                    ? Theme.of(context).primaryOrange
                                    : Theme.of(context)
                                        .primaryOrange
                                        .withOpacity(0.4),
                              ),
                              Stack(
                                clipBehavior: Clip.none,
                                alignment: Alignment.topCenter,
                                children: [
                                  InkWell(
                                    borderRadius: BorderRadius.circular(50),
                                    onTap: () {
                                      context
                                          .read<PersonalInfoCubit>()
                                          .changeProcessIdx(2);
                                    },
                                    child: CircleAvatar(
                                      radius: 26,
                                      backgroundColor: state.processIdx >= 2
                                          ? Theme.of(context).primaryOrange
                                          : Theme.of(context)
                                              .primaryOrange
                                              .withOpacity(0.4),
                                      child: Text(
                                        "3",
                                        style: subHeader.copyWith(
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: -44,
                                    child: SizedBox(
                                      width: 80,
                                      child: Text(
                                        "Informasi Perusahaan",
                                        textAlign: TextAlign.center,
                                        style: subHeader.copyWith(
                                            color: Theme.of(context)
                                                .primaryOrange),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(
                    height: 55,
                  ),
                  // FORM FIELD
                  Expanded(
                    child: BlocBuilder<PersonalInfoCubit, PersonalInfoState>(
                      builder: (context, state) {
                        PersonalInfoCubit controller =
                            context.read<PersonalInfoCubit>();
                        if (state.processIdx == 0) {
                          return _biodataDiri(controller, state, context);
                        } else if (state.processIdx == 1) {
                          return _alamatPribadi(controller, state, context);
                        } else {
                          return _informasiPerusahaan(
                              controller, state, context);
                        }
                      },
                    ),
                  )
                ]),
              ),
            ),
            if (state is PersonalInfoStateLoading)
              Container(
                height: getHeight(context),
                width: getWidth(context),
                color: Colors.black.withOpacity(0.3),
                child: Center(
                    child: SizedBox(
                  height: 60,
                  width: 60,
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryOrange,
                    strokeWidth: 8,
                  ),
                )),
              )
          ],
        );
      },
    );
  }

  SingleChildScrollView _biodataDiri(PersonalInfoCubit controller,
      PersonalInfoState state, BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomTextField(
            label: "NAMA LENGKAP",
            hint: "Masukkan Nama Anda",
            textEditingController: controller.namaController,
          ),
          const SizedBox(
            height: 18,
          ),
          CustomDatePick(
            hint: "hint",
            label: "TANGGAL LAHIR",
            value: state.tanggalLahir,
            selectedDate: (date) {
              if (date != null) {
                controller
                    .setTanggalLahir(DateFormat("dd MMM yyyy").format(date));
              }
            },
          ),
          const SizedBox(
            height: 18,
          ),
          CustomDropDown(
            hint: 'hint',
            label: "JENIS KELAMIN",
            option: controller.gender,
            selected: state.selecteGender,
            onChange: (String value) {
              controller.setGender(value);
            },
          ),
          const SizedBox(
            height: 18,
          ),
          CustomTextField(
            hint: "hint",
            textEditingController: controller.emailController,
            label: "ALAMAT EMAIL",
            readOnly: true,
          ),
          const SizedBox(
            height: 18,
          ),
          CustomTextField(
            hint: "Contoh: 081234567xxx",
            textEditingController: controller.hpController,
            label: "NO. HP",
          ),
          const SizedBox(
            height: 18,
          ),
          CustomDropDown(
            hint: 'hint',
            label: "PENDIDIKAN",
            option: controller.pendidikan,
            selected: state.selectedPendidikan,
            onChange: (String value) {
              controller.setPendidikan(value);
            },
          ),
          const SizedBox(
            height: 18,
          ),
          CustomDropDown(
            hint: 'hint',
            label: "STATUS PERKAWINAN",
            option: controller.status,
            selected: state.selectedStatus,
            onChange: (String value) {
              controller.setStatus(value);
            },
          ),
          const SizedBox(
            height: 18,
          ),
          InkWell(
            onTap: () {
              controller.processBiodataDiri();
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Theme.of(context).primaryOrange),
              alignment: Alignment.center,
              child: Text(
                "Selanjutnya",
                style: header.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

SingleChildScrollView _alamatPribadi(PersonalInfoCubit controller,
    PersonalInfoState state, BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      children: [
        Container(
          clipBehavior: Clip.none,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color.fromARGB(255, 241, 245, 247)),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("Upload KTP"),
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              controller.takePicGallery();
                              Navigator.of(context).pop();
                            },
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              padding: EdgeInsets.all(18),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .primaryOrange
                                      .withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(16)),
                              height: 55,
                              child: Text(
                                "Gallery",
                                style: subHeaderBold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            onTap: () {
                              controller.takePicture();
                              Navigator.of(context).pop();
                            },
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              padding: EdgeInsets.all(12),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .primaryOrange
                                      .withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(16)),
                              height: 55,
                              child: Text(
                                "Camera",
                                style: subHeaderBold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Container(
                      height: 34,
                      width: 34,
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color:
                              Theme.of(context).primaryOrange.withOpacity(0.2)),
                      child: SvgPicture.asset(
                        "assets/icons/card.svg",
                        colorFilter: ColorFilter.mode(
                            Theme.of(context).primaryOrange, BlendMode.srcIn),
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Upload KTP",
                          style: subHeader,
                        ),
                        if (state.ktp_path != "")
                          Text(
                            "${state.ktp_path}",
                            style: subHeader,
                          ),
                      ],
                    ),
                    Spacer(),
                    if (state.ktp_path != "")
                      CircleAvatar(
                        radius: 14,
                        backgroundColor: Colors.green,
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                      )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                label: "NIK",
                hint: "Masukkan NIK Anda",
                textEditingController: controller.nikController,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        CustomTextField(
          label: "ALAMAT SESUAI KTP",
          hint: "Masukkan alamat Anda",
          textEditingController: controller.alamatKtpController,
        ),
        const SizedBox(
          height: 18,
        ),
        CustomDropDown(
          hint: 'hint',
          label: "PROVINSI",
          option: controller.provinsi,
          selected: state.provinsi,
          onChange: (String value) {
            controller.setProv(value);
          },
        ),
        const SizedBox(
          height: 18,
        ),
        CustomDropDown(
          hint: 'hint',
          label: "KOTA/KABUPATEN",
          option: controller.kota,
          selected: state.kota,
          onChange: (String value) {
            controller.setKota(value);
          },
        ),
        const SizedBox(
          height: 18,
        ),
        CustomDropDown(
          hint: 'hint',
          label: "KECAMATAN",
          option: controller.kecamatan,
          selected: state.kecamatan,
          onChange: (String value) {
            controller.setKec(value);
          },
        ),
        const SizedBox(
          height: 18,
        ),
        CustomDropDown(
          hint: 'hint',
          label: "KELURAHAN",
          option: controller.kelurahan,
          selected: state.kelurahan,
          onChange: (String value) {
            controller.setKel(value);
          },
        ),
        const SizedBox(
          height: 18,
        ),
        CustomTextField(
          hint: "Contoh: 6172XX",
          textEditingController: controller.kodePosController,
          label: "KODE POS",
        ),
        const SizedBox(
          height: 18,
        ),
        Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  controller.changeProcessIdx(0);
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border:
                          Border.all(color: Theme.of(context).primaryOrange)),
                  alignment: Alignment.center,
                  child: Text(
                    "Sebelumnya",
                    style:
                        header.copyWith(color: Theme.of(context).primaryOrange),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  controller.processAlamat();
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Theme.of(context).primaryOrange),
                  alignment: Alignment.center,
                  child: Text(
                    "Selanjutnya",
                    style: header.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

SingleChildScrollView _informasiPerusahaan(PersonalInfoCubit controller,
    PersonalInfoState state, BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      children: [
        const SizedBox(
          height: 18,
        ),
        CustomTextField(
          label: "NAMA USAHA / PERUSAHAAN",
          hint: "",
          textEditingController: controller.namaPerController,
        ),
        const SizedBox(
          height: 18,
        ),
        CustomTextField(
          label: "ALAMAT USAHA / PERUSAHAAN",
          hint: "",
          textEditingController: controller.alamatPerController,
        ),
        const SizedBox(
          height: 18,
        ),
        CustomDropDown(
          hint: 'hint',
          label: "JABATAN",
          option: controller.jabatan,
          selected: state.jabatan,
          onChange: (String value) {
            controller.setJabatan(value);
          },
        ),
        const SizedBox(
          height: 18,
        ),
        CustomDropDown(
          hint: 'hint',
          label: "LAMA BEKERJA",
          option: controller.durasi,
          selected: state.durasiKerja,
          onChange: (String value) {
            controller.setDurasi(value);
          },
        ),
        const SizedBox(
          height: 18,
        ),
        CustomDropDown(
          hint: 'hint',
          label: "SUMBER PENDAPATAN",
          option: controller.sumberPendapatan,
          selected: state.sumberPendapatan,
          onChange: (String value) {
            controller.setSumber(value);
          },
        ),
        const SizedBox(
          height: 18,
        ),
        CustomDropDown(
          hint: 'hint',
          label: "PENDAPATAN KOTOR PERTAHUN",
          option: controller.nominalPendapatan,
          selected: state.pendapatanKotor,
          onChange: (String value) {
            controller.setNominalPendapatan(value);
          },
        ),
        const SizedBox(
          height: 18,
        ),
        CustomDropDown(
          hint: 'hint',
          label: "NAMA BANK",
          option: controller.bank,
          selected: state.namaBank,
          onChange: (String value) {
            controller.setBank(value);
          },
        ),
        const SizedBox(
          height: 18,
        ),
        CustomTextField(
          hint: "",
          textEditingController: controller.cabangBankController,
          label: "CABANG BANK",
        ),
        const SizedBox(
          height: 18,
        ),
        CustomTextField(
          hint: "",
          textEditingController: controller.noRekController,
          label: "NOMOR REKENING",
        ),
        const SizedBox(
          height: 18,
        ),
        CustomTextField(
          hint: "",
          textEditingController: controller.namaRekController,
          label: "NAMA PEMILIK REKENING",
        ),
        const SizedBox(
          height: 18,
        ),
        Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  controller.changeProcessIdx(0);
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border:
                          Border.all(color: Theme.of(context).primaryOrange)),
                  alignment: Alignment.center,
                  child: Text(
                    "Sebelumnya",
                    style:
                        header.copyWith(color: Theme.of(context).primaryOrange),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  controller.processAndSave();
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Theme.of(context).primaryOrange),
                  alignment: Alignment.center,
                  child: Text(
                    "Simpan",
                    style: header.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final bool aMust;
  final TextEditingController textEditingController;
  final bool readOnly;
  const CustomTextField({
    super.key,
    required this.hint,
    required this.textEditingController,
    required this.label,
    this.aMust = false,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (aMust)
              Text(
                "* ",
                style: subHeader.copyWith(color: Colors.red),
              ),
            Text(
              label,
              style: subHeader,
            ),
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        SizedBox(
          height: 50,
          child: TextField(
            controller: textEditingController,
            style: header,
            readOnly: readOnly,
            decoration: InputDecoration(
              filled: true,
              fillColor:
                  readOnly ? Colors.blueGrey.shade100 : Colors.blueGrey.shade50,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
              hintText: hint,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(color: Colors.grey.shade700),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(color: Colors.black),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomDropDown extends StatelessWidget {
  final String label;
  final String hint;
  final bool aMust;
  final List option;
  final String selected;
  final Function(String val)? onChange;
  const CustomDropDown({
    super.key,
    required this.hint,
    required this.label,
    this.aMust = false,
    required this.option,
    required this.selected,
    this.onChange,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (aMust)
              Text(
                "* ",
                style: subHeader.copyWith(color: Colors.red),
              ),
            Text(
              label,
              style: subHeader,
            ),
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        SizedBox(
            height: 50,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.grey.shade700),
              ),
              alignment: Alignment.center,
              child: ButtonTheme(
                alignedDropdown: true,
                child: DropdownButton(
                  dropdownColor: Theme.of(context).buttonBackground,
                  value: selected,
                  isExpanded: true,
                  style: subHeader.copyWith(color: Colors.black),
                  icon: const Icon(Icons.keyboard_arrow_down_rounded),
                  items: option
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(e),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    //   context
                    //       .read<HomeCubit>()
                    //       .setFilterWellness(value!);
                    onChange?.call(value.toString());
                  },
                ),
              ),
            )),
      ],
    );
  }
}

class CustomDatePick extends StatelessWidget {
  final String label;
  final String hint;
  final bool aMust;
  final Function(DateTime?)? selectedDate;
  final String value;
  const CustomDatePick({
    super.key,
    required this.hint,
    required this.label,
    this.selectedDate,
    this.value = "",
    this.aMust = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (aMust)
              Text(
                "* ",
                style: subHeader.copyWith(color: Colors.red),
              ),
            Text(
              label,
              style: subHeader,
            ),
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        SizedBox(
            height: 50,
            child: InkWell(
              onTap: () async {
                DateTime? result = await showFirstDatepicker(context);
                selectedDate?.call(result);
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Colors.grey.shade700),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "$value",
                        style: header,
                      ),
                      Icon(
                        Icons.date_range,
                        color: Colors.grey.shade700,
                      )
                    ]),
              ),
            )),
      ],
    );
  }

  Future<DateTime?> showFirstDatepicker(BuildContext context) async {
    DateTime? value = await showDatePicker(
        builder: (context, child) {
          return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                    primary: Theme.of(context).primaryOrange,
                    onPrimary: Colors.black,
                    surface: Colors.white,
                    onSurface: Colors.black),
              ),
              child: child!);
        },
        context: context,
        firstDate: DateTime(2024),
        currentDate: DateTime.now(),
        lastDate: DateTime.now());
    return value;
  }
}
