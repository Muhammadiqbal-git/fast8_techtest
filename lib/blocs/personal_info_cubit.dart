import 'dart:developer';
import 'dart:io';

import 'package:fast8_techtest/models/user_model.dart';
import 'package:fast8_techtest/services/db.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class PersonalInfoCubit extends Cubit<PersonalInfoState> {
  PersonalInfoCubit() : super(PersonalInfoInitial()) {
    checkKTP();
  }
  final DatabaseLocal _db = DatabaseLocal();

  final List gender = [
    "Laki-Laki",
    "Perempuan",
  ];
  final List pendidikan = [
    "SD",
    "SMP",
    "SMA",
    "D1",
    "D2",
    "D3",
    "S1",
    "S2",
    "S3",
  ];
  final List status = [
    "Belum Kawin",
    "Kawin",
    "Janda",
    "Duda",
  ];

  final List provinsi = [
    "Provinsi A",
    "Provinsi B",
    "Provinsi C",
  ];
  final List kota = [
    "Kota A",
    "Kota B",
    "Kota C",
  ];
  final List kecamatan = [
    "Kecamatan A",
    "Kecamatan B",
    "Kecamatan C",
  ];
  final List kelurahan = [
    "Kelurahan A",
    "Kelurahan B",
    "Kelurahan C",
  ];
  final List jabatan = [
    "Jabatan A",
    "Jabatan B",
    "Jabatan C",
  ];
  final List durasi = [
    "< 6 Bulan",
    "6 Bulan - 1 Tahun",
    "> 1 Tahun",
  ];
  final List sumberPendapatan = [
    "Pendapatan A",
    "Pendapatan B",
    "Pendapatan C",
  ];
  final List nominalPendapatan = [
    "< 10 Juta",
    "10 Juta - 100 Juta",
    "> 100 Juta",
  ];
  final List bank = [
    "Bank A",
    "Bank B",
    "Bank C",
  ];

  final TextEditingController namaController = TextEditingController();
  final TextEditingController hpController = TextEditingController();
  final TextEditingController emailController =
      TextEditingController(text: "iqbal.dev.code@gmail.com");
  final TextEditingController nikController = TextEditingController();
  final TextEditingController alamatKtpController = TextEditingController();
  final TextEditingController kodePosController = TextEditingController();
  final TextEditingController namaPerController = TextEditingController();
  final TextEditingController alamatPerController = TextEditingController();
  final TextEditingController cabangBankController = TextEditingController();
  final TextEditingController noRekController = TextEditingController();
  final TextEditingController namaRekController = TextEditingController();
  final ImagePicker picker = ImagePicker();

  getData() async {
    List data = await _db.getData("users");
    if (data.length == 0) {
      return;
    }
    UserModel userModel = UserModel.fromJson(data[0]);
    namaController.text = userModel.nama ?? "";
    hpController.text = userModel.noHp ?? "";
    emailController.text = userModel.email ?? "";
    nikController.text = userModel.nik ?? "";
    alamatKtpController.text = userModel.alamatKTP ?? "";
    kodePosController.text = userModel.kodePos ?? "";
    namaPerController.text = userModel.namaPerusahaan ?? "";
    alamatPerController.text = userModel.alamatPerusahaan ?? "";
    cabangBankController.text = userModel.cabangBank ?? "";
    noRekController.text = userModel.norek ?? "";
    namaRekController.text = userModel.namaRek ?? "";

    emit(PersonalInfoState(
        ktp_path: state.ktp_path,
        nama: userModel.nama ?? "",
        noHp: userModel.noHp ?? "",
        email: userModel.email ?? "",
        selecteGender: userModel.selecteGender ?? "",
        tanggalLahir: userModel.tanggalLahir ?? '',
        selectedPendidikan: userModel.selectedPendidikan ?? "",
        selectedStatus: userModel.selectedStatus ?? "",
        processIdx: 0,
        nik: userModel.nik ?? "",
        alamatKTP: userModel.alamatKTP ?? "",
        provinsi: userModel.provinsi ?? "",
        kota: userModel.kota ?? "",
        kecamatan: userModel.kecamatan ?? "",
        kelurahan: userModel.kelurahan ?? "",
        kodePos: userModel.kodePos ?? "",
        namaPerusahaan: userModel.namaPerusahaan ?? "",
        alamatPerusahaan: userModel.alamatPerusahaan ?? "",
        jabatan: userModel.jabatan ?? "",
        durasiKerja: userModel.durasiKerja ?? "",
        sumberPendapatan: userModel.sumberPendapatan ?? "",
        pendapatanKotor: userModel.pendapatanKotor ?? "",
        namaBank: userModel.namaBank ?? "",
        cabangBank: userModel.cabangBank ?? "",
        norek: userModel.norek ?? "",
        namaRek: userModel.namaRek ?? ""));
    print("saaaaaa");
  }

  setData() async {
    UserModel data = UserModel(
        state.nama,
        state.email,
        state.noHp,
        state.tanggalLahir,
        state.selecteGender,
        state.selectedPendidikan,
        state.selectedStatus,
        state.nik,
        state.alamatKTP,
        state.provinsi,
        state.kota,
        state.kecamatan,
        state.kelurahan,
        state.kodePos,
        state.namaPerusahaan,
        state.alamatPerusahaan,
        state.jabatan,
        state.durasiKerja,
        state.sumberPendapatan,
        state.pendapatanKotor,
        state.namaBank,
        state.cabangBank,
        state.norek,
        state.namaRek);
    bool result = await _db.insert("users", data.toMap());
    await Future.delayed(const Duration(milliseconds: 1500));

    if (result) {
      emit(PersonalInfoDoneSave(state));
    }
  }

  takePicture() async {
    final pathApps = await getApplicationDocumentsDirectory();
    final localPath = pathApps.path;
    final finalPath = "$localPath/local-ktp.jpeg";
    final FileImage data = FileImage(File(finalPath));
    final XFile? img = await picker.pickImage(source: ImageSource.camera);
    if (img == null) {
      return;
    }

    await img.saveTo(finalPath);
    checkKTP();
  }

  takePicGallery() async {
    final XFile? img = await picker.pickImage(source: ImageSource.gallery);
    if (img == null) {
      return;
    }
    final pathApps = await getApplicationDocumentsDirectory();
    final localPath = pathApps.path;
    final finalPath = "$localPath/local-ktp.jpeg";
    final FileImage data = FileImage(File(finalPath));

    await img.saveTo(finalPath);
    checkKTP();
  }

  checkKTP() async {
    final pathApps = await getApplicationDocumentsDirectory();
    final localPath = pathApps.path;
    final finalPath = "$localPath/local-ktp.jpeg";
    if (File(finalPath).existsSync()) {
      emit(
        PersonalInfoState(
          ktp_path: "local-ktp.jpeg",
          nama: state.nama,
          noHp: state.noHp,
          email: state.email,
          tanggalLahir: state.tanggalLahir,
          selecteGender: state.selecteGender,
          selectedPendidikan: state.selectedPendidikan,
          selectedStatus: state.selectedStatus,
          processIdx: state.processIdx,
          nik: state.nik,
          alamatKTP: state.alamatKTP,
          provinsi: state.provinsi,
          kota: state.kota,
          kecamatan: state.kecamatan,
          kelurahan: state.kelurahan,
          kodePos: state.kodePos,
          namaPerusahaan: state.namaPerusahaan,
          alamatPerusahaan: state.alamatPerusahaan,
          jabatan: state.jabatan,
          durasiKerja: state.durasiKerja,
          sumberPendapatan: state.sumberPendapatan,
          pendapatanKotor: state.pendapatanKotor,
          namaBank: state.namaBank,
          cabangBank: state.cabangBank,
          norek: state.norek,
          namaRek: state.namaRek,
        ),
      );
    }
  }

  void changeProcessIdx(int val) {
    emit(
      PersonalInfoState(
        ktp_path: state.ktp_path,
        nama: state.nama,
        noHp: state.noHp,
        email: state.email,
        tanggalLahir: state.tanggalLahir,
        selecteGender: state.selecteGender,
        selectedPendidikan: state.selectedPendidikan,
        selectedStatus: state.selectedStatus,
        processIdx: val,
        nik: state.nik,
        alamatKTP: state.alamatKTP,
        provinsi: state.provinsi,
        kota: state.kota,
        kecamatan: state.kecamatan,
        kelurahan: state.kelurahan,
        kodePos: state.kodePos,
        namaPerusahaan: state.namaPerusahaan,
        alamatPerusahaan: state.alamatPerusahaan,
        jabatan: state.jabatan,
        durasiKerja: state.durasiKerja,
        sumberPendapatan: state.sumberPendapatan,
        pendapatanKotor: state.pendapatanKotor,
        namaBank: state.namaBank,
        cabangBank: state.cabangBank,
        norek: state.norek,
        namaRek: state.namaRek,
      ),
    );
  }

  void processBiodataDiri() {
    emit(
      PersonalInfoState(
        ktp_path: state.ktp_path,
        nama: namaController.text,
        noHp: hpController.text,
        email: emailController.text,
        tanggalLahir: state.tanggalLahir,
        selecteGender: state.selecteGender,
        selectedPendidikan: state.selectedPendidikan,
        selectedStatus: state.selectedStatus,
        processIdx: 1,
        nik: state.nik,
        alamatKTP: state.alamatKTP,
        provinsi: state.provinsi,
        kota: state.kota,
        kecamatan: state.kecamatan,
        kelurahan: state.kelurahan,
        kodePos: state.kodePos,
        namaPerusahaan: state.namaPerusahaan,
        alamatPerusahaan: state.alamatPerusahaan,
        jabatan: state.jabatan,
        durasiKerja: state.durasiKerja,
        sumberPendapatan: state.sumberPendapatan,
        pendapatanKotor: state.pendapatanKotor,
        namaBank: state.namaBank,
        cabangBank: state.cabangBank,
        norek: state.norek,
        namaRek: state.namaRek,
      ),
    );
  }

  void processAlamat() {
    emit(
      PersonalInfoState(
        ktp_path: state.ktp_path,
        nama: state.nama,
        noHp: state.noHp,
        email: state.email,
        tanggalLahir: state.tanggalLahir,
        selecteGender: state.selecteGender,
        selectedPendidikan: state.selectedPendidikan,
        selectedStatus: state.selectedStatus,
        processIdx: 2,
        nik: nikController.text,
        alamatKTP: alamatKtpController.text,
        provinsi: state.provinsi,
        kota: state.kota,
        kecamatan: state.kecamatan,
        kelurahan: state.kelurahan,
        kodePos: kodePosController.text,
        namaPerusahaan: state.namaPerusahaan,
        alamatPerusahaan: state.alamatPerusahaan,
        jabatan: state.jabatan,
        durasiKerja: state.durasiKerja,
        sumberPendapatan: state.sumberPendapatan,
        pendapatanKotor: state.pendapatanKotor,
        namaBank: state.namaBank,
        cabangBank: state.cabangBank,
        norek: state.norek,
        namaRek: state.namaRek,
      ),
    );
  }

  void processAndSave() {
    emit(
      PersonalInfoState(
        ktp_path: state.ktp_path,
        nama: state.nama,
        noHp: state.noHp,
        email: state.email,
        tanggalLahir: state.tanggalLahir,
        selecteGender: state.selecteGender,
        selectedPendidikan: state.selectedPendidikan,
        selectedStatus: state.selectedStatus,
        processIdx: 2,
        nik: state.nik,
        alamatKTP: state.alamatKTP,
        provinsi: state.provinsi,
        kota: state.kota,
        kecamatan: state.kecamatan,
        kelurahan: state.kelurahan,
        kodePos: state.kodePos,
        namaPerusahaan: namaPerController.text,
        alamatPerusahaan: alamatPerController.text,
        jabatan: state.jabatan,
        durasiKerja: state.durasiKerja,
        sumberPendapatan: state.sumberPendapatan,
        pendapatanKotor: state.pendapatanKotor,
        namaBank: state.namaBank,
        cabangBank: cabangBankController.text,
        norek: noRekController.text,
        namaRek: namaRekController.text,
      ),
    );
    emit(PersonalInfoStateLoading(state));
    setData();
  }

  void setGender(String val) {
    emit(
      PersonalInfoState(
        ktp_path: state.ktp_path,
        nama: state.nama,
        noHp: state.noHp,
        email: state.email,
        selecteGender: val,
        tanggalLahir: state.tanggalLahir,
        selectedPendidikan: state.selectedPendidikan,
        selectedStatus: state.selectedStatus,
        processIdx: state.processIdx,
        nik: state.nik,
        alamatKTP: state.alamatKTP,
        provinsi: state.provinsi,
        kota: state.kota,
        kecamatan: state.kecamatan,
        kelurahan: state.kelurahan,
        kodePos: state.kodePos,
        namaPerusahaan: state.namaPerusahaan,
        alamatPerusahaan: state.alamatPerusahaan,
        jabatan: state.jabatan,
        durasiKerja: state.durasiKerja,
        sumberPendapatan: state.sumberPendapatan,
        pendapatanKotor: state.pendapatanKotor,
        namaBank: state.namaBank,
        cabangBank: state.cabangBank,
        norek: state.norek,
        namaRek: state.namaRek,
      ),
    );
  }

  void setStatus(String val) {
    emit(PersonalInfoState(
      ktp_path: state.ktp_path,
      nama: state.nama,
      noHp: state.noHp,
      email: state.email,
      tanggalLahir: state.tanggalLahir,
      selecteGender: state.selecteGender,
      selectedPendidikan: state.selectedPendidikan,
      selectedStatus: val,
      processIdx: state.processIdx,
      nik: state.nik,
      alamatKTP: state.alamatKTP,
      provinsi: state.provinsi,
      kota: state.kota,
      kecamatan: state.kecamatan,
      kelurahan: state.kelurahan,
      kodePos: state.kodePos,
      namaPerusahaan: state.namaPerusahaan,
      alamatPerusahaan: state.alamatPerusahaan,
      jabatan: state.jabatan,
      durasiKerja: state.durasiKerja,
      sumberPendapatan: state.sumberPendapatan,
      pendapatanKotor: state.pendapatanKotor,
      namaBank: state.namaBank,
      cabangBank: state.cabangBank,
      norek: state.norek,
      namaRek: state.namaRek,
    ));
  }

  void setPendidikan(String val) {
    emit(PersonalInfoState(
      ktp_path: state.ktp_path,
      nama: state.nama,
      noHp: state.noHp,
      email: state.email,
      tanggalLahir: state.tanggalLahir,
      selecteGender: state.selecteGender,
      selectedPendidikan: val,
      selectedStatus: state.selectedStatus,
      processIdx: state.processIdx,
      nik: state.nik,
      alamatKTP: state.alamatKTP,
      provinsi: state.provinsi,
      kota: state.kota,
      kecamatan: state.kecamatan,
      kelurahan: state.kelurahan,
      kodePos: state.kodePos,
      namaPerusahaan: state.namaPerusahaan,
      alamatPerusahaan: state.alamatPerusahaan,
      jabatan: state.jabatan,
      durasiKerja: state.durasiKerja,
      sumberPendapatan: state.sumberPendapatan,
      pendapatanKotor: state.pendapatanKotor,
      namaBank: state.namaBank,
      cabangBank: state.cabangBank,
      norek: state.norek,
      namaRek: state.namaRek,
    ));
  }

  void setTanggalLahir(String val) {
    emit(PersonalInfoState(
      ktp_path: state.ktp_path,
      nama: state.nama,
      noHp: state.noHp,
      email: state.email,
      tanggalLahir: val,
      selecteGender: state.selecteGender,
      selectedPendidikan: state.selectedPendidikan,
      selectedStatus: state.selectedStatus,
      processIdx: state.processIdx,
      nik: state.nik,
      alamatKTP: state.alamatKTP,
      provinsi: state.provinsi,
      kota: state.kota,
      kecamatan: state.kecamatan,
      kelurahan: state.kelurahan,
      kodePos: state.kodePos,
      namaPerusahaan: state.namaPerusahaan,
      alamatPerusahaan: state.alamatPerusahaan,
      jabatan: state.jabatan,
      durasiKerja: state.durasiKerja,
      sumberPendapatan: state.sumberPendapatan,
      pendapatanKotor: state.pendapatanKotor,
      namaBank: state.namaBank,
      cabangBank: state.cabangBank,
      norek: state.norek,
      namaRek: state.namaRek,
    ));
  }

  void setProv(String val) {
    emit(
      PersonalInfoState(
        ktp_path: state.ktp_path,
        nama: state.nama,
        noHp: state.noHp,
        email: state.email,
        tanggalLahir: state.tanggalLahir,
        selecteGender: state.selecteGender,
        selectedPendidikan: state.selectedPendidikan,
        selectedStatus: state.selectedStatus,
        processIdx: state.processIdx,
        nik: state.nik,
        alamatKTP: state.alamatKTP,
        provinsi: val,
        kota: state.kota,
        kecamatan: state.kecamatan,
        kelurahan: state.kelurahan,
        kodePos: state.kodePos,
        namaPerusahaan: state.namaPerusahaan,
        alamatPerusahaan: state.alamatPerusahaan,
        jabatan: state.jabatan,
        durasiKerja: state.durasiKerja,
        sumberPendapatan: state.sumberPendapatan,
        pendapatanKotor: state.pendapatanKotor,
        namaBank: state.namaBank,
        cabangBank: state.cabangBank,
        norek: state.norek,
        namaRek: state.namaRek,
      ),
    );
  }

  void setKota(String val) {
    emit(
      PersonalInfoState(
        ktp_path: state.ktp_path,
        nama: state.nama,
        noHp: state.noHp,
        email: state.email,
        tanggalLahir: state.tanggalLahir,
        selecteGender: state.selecteGender,
        selectedPendidikan: state.selectedPendidikan,
        selectedStatus: state.selectedStatus,
        processIdx: state.processIdx,
        nik: state.nik,
        alamatKTP: state.alamatKTP,
        provinsi: state.provinsi,
        kota: val,
        kecamatan: state.kecamatan,
        kelurahan: state.kelurahan,
        kodePos: state.kodePos,
        namaPerusahaan: state.namaPerusahaan,
        alamatPerusahaan: state.alamatPerusahaan,
        jabatan: state.jabatan,
        durasiKerja: state.durasiKerja,
        sumberPendapatan: state.sumberPendapatan,
        pendapatanKotor: state.pendapatanKotor,
        namaBank: state.namaBank,
        cabangBank: state.cabangBank,
        norek: state.norek,
        namaRek: state.namaRek,
      ),
    );
  }

  void setKec(String val) {
    emit(
      PersonalInfoState(
        ktp_path: state.ktp_path,
        nama: state.nama,
        noHp: state.noHp,
        email: state.email,
        tanggalLahir: state.tanggalLahir,
        selecteGender: state.selecteGender,
        selectedPendidikan: state.selectedPendidikan,
        selectedStatus: state.selectedStatus,
        processIdx: state.processIdx,
        nik: state.nik,
        alamatKTP: state.alamatKTP,
        provinsi: state.provinsi,
        kota: state.kota,
        kecamatan: val,
        kelurahan: state.kelurahan,
        kodePos: state.kodePos,
        namaPerusahaan: state.namaPerusahaan,
        alamatPerusahaan: state.alamatPerusahaan,
        jabatan: state.jabatan,
        durasiKerja: state.durasiKerja,
        sumberPendapatan: state.sumberPendapatan,
        pendapatanKotor: state.pendapatanKotor,
        namaBank: state.namaBank,
        cabangBank: state.cabangBank,
        norek: state.norek,
        namaRek: state.namaRek,
      ),
    );
  }

  void setKel(String val) {
    emit(
      PersonalInfoState(
        ktp_path: state.ktp_path,
        nama: state.nama,
        noHp: state.noHp,
        email: state.email,
        tanggalLahir: state.tanggalLahir,
        selecteGender: state.selecteGender,
        selectedPendidikan: state.selectedPendidikan,
        selectedStatus: state.selectedStatus,
        processIdx: state.processIdx,
        nik: state.nik,
        alamatKTP: state.alamatKTP,
        provinsi: state.provinsi,
        kota: state.kota,
        kecamatan: state.kecamatan,
        kelurahan: val,
        kodePos: state.kodePos,
        namaPerusahaan: state.namaPerusahaan,
        alamatPerusahaan: state.alamatPerusahaan,
        jabatan: state.jabatan,
        durasiKerja: state.durasiKerja,
        sumberPendapatan: state.sumberPendapatan,
        pendapatanKotor: state.pendapatanKotor,
        namaBank: state.namaBank,
        cabangBank: state.cabangBank,
        norek: state.norek,
        namaRek: state.namaRek,
      ),
    );
  }

  void setJabatan(String val) {
    emit(
      PersonalInfoState(
        ktp_path: state.ktp_path,
        nama: state.nama,
        noHp: state.noHp,
        email: state.email,
        tanggalLahir: state.tanggalLahir,
        selecteGender: state.selecteGender,
        selectedPendidikan: state.selectedPendidikan,
        selectedStatus: state.selectedStatus,
        processIdx: state.processIdx,
        nik: state.nik,
        alamatKTP: state.alamatKTP,
        provinsi: state.provinsi,
        kota: state.kota,
        kecamatan: state.kecamatan,
        kelurahan: state.kelurahan,
        kodePos: state.kodePos,
        namaPerusahaan: state.namaPerusahaan,
        alamatPerusahaan: state.alamatPerusahaan,
        jabatan: val,
        durasiKerja: state.durasiKerja,
        sumberPendapatan: state.sumberPendapatan,
        pendapatanKotor: state.pendapatanKotor,
        namaBank: state.namaBank,
        cabangBank: state.cabangBank,
        norek: state.norek,
        namaRek: state.namaRek,
      ),
    );
  }

  void setDurasi(String val) {
    emit(
      PersonalInfoState(
        ktp_path: state.ktp_path,
        nama: state.nama,
        noHp: state.noHp,
        email: state.email,
        tanggalLahir: state.tanggalLahir,
        selecteGender: state.selecteGender,
        selectedPendidikan: state.selectedPendidikan,
        selectedStatus: state.selectedStatus,
        processIdx: state.processIdx,
        nik: state.nik,
        alamatKTP: state.alamatKTP,
        provinsi: state.provinsi,
        kota: state.kota,
        kecamatan: state.kecamatan,
        kelurahan: state.kelurahan,
        kodePos: state.kodePos,
        namaPerusahaan: state.namaPerusahaan,
        alamatPerusahaan: state.alamatPerusahaan,
        jabatan: state.jabatan,
        durasiKerja: val,
        sumberPendapatan: state.sumberPendapatan,
        pendapatanKotor: state.pendapatanKotor,
        namaBank: state.namaBank,
        cabangBank: state.cabangBank,
        norek: state.norek,
        namaRek: state.namaRek,
      ),
    );
  }

  void setSumber(String val) {
    emit(
      PersonalInfoState(
        ktp_path: state.ktp_path,
        nama: state.nama,
        noHp: state.noHp,
        email: state.email,
        tanggalLahir: state.tanggalLahir,
        selecteGender: state.selecteGender,
        selectedPendidikan: state.selectedPendidikan,
        selectedStatus: state.selectedStatus,
        processIdx: state.processIdx,
        nik: state.nik,
        alamatKTP: state.alamatKTP,
        provinsi: state.provinsi,
        kota: state.kota,
        kecamatan: state.kecamatan,
        kelurahan: state.kelurahan,
        kodePos: state.kodePos,
        namaPerusahaan: state.namaPerusahaan,
        alamatPerusahaan: state.alamatPerusahaan,
        jabatan: state.jabatan,
        durasiKerja: state.durasiKerja,
        sumberPendapatan: val,
        pendapatanKotor: state.pendapatanKotor,
        namaBank: state.namaBank,
        cabangBank: state.cabangBank,
        norek: state.norek,
        namaRek: state.namaRek,
      ),
    );
  }

  void setNominalPendapatan(String val) {
    emit(
      PersonalInfoState(
        ktp_path: state.ktp_path,
        nama: state.nama,
        noHp: state.noHp,
        email: state.email,
        tanggalLahir: state.tanggalLahir,
        selecteGender: state.selecteGender,
        selectedPendidikan: state.selectedPendidikan,
        selectedStatus: state.selectedStatus,
        processIdx: state.processIdx,
        nik: state.nik,
        alamatKTP: state.alamatKTP,
        provinsi: state.provinsi,
        kota: state.kota,
        kecamatan: state.kecamatan,
        kelurahan: state.kelurahan,
        kodePos: state.kodePos,
        namaPerusahaan: state.namaPerusahaan,
        alamatPerusahaan: state.alamatPerusahaan,
        jabatan: state.jabatan,
        durasiKerja: state.durasiKerja,
        sumberPendapatan: state.sumberPendapatan,
        pendapatanKotor: val,
        namaBank: state.namaBank,
        cabangBank: state.cabangBank,
        norek: state.norek,
        namaRek: state.namaRek,
      ),
    );
  }

  void setBank(String val) {
    emit(
      PersonalInfoState(
        ktp_path: state.ktp_path,
        nama: state.nama,
        noHp: state.noHp,
        email: state.email,
        tanggalLahir: state.tanggalLahir,
        selecteGender: state.selecteGender,
        selectedPendidikan: state.selectedPendidikan,
        selectedStatus: state.selectedStatus,
        processIdx: state.processIdx,
        nik: state.nik,
        alamatKTP: state.alamatKTP,
        provinsi: state.provinsi,
        kota: state.kota,
        kecamatan: state.kecamatan,
        kelurahan: state.kelurahan,
        kodePos: state.kodePos,
        namaPerusahaan: state.namaPerusahaan,
        alamatPerusahaan: state.alamatPerusahaan,
        jabatan: state.jabatan,
        durasiKerja: state.durasiKerja,
        sumberPendapatan: state.sumberPendapatan,
        pendapatanKotor: state.pendapatanKotor,
        namaBank: val,
        cabangBank: state.cabangBank,
        norek: state.norek,
        namaRek: state.namaRek,
      ),
    );
  }
}

class PersonalInfoState {
  final String ktp_path;
  final String nama;
  final String email;
  final String noHp;
  final String selecteGender;
  final String tanggalLahir;
  final String selectedPendidikan;
  final String selectedStatus;
  final int processIdx;
  final String nik;
  final String alamatKTP;
  final String provinsi;
  final String kota;
  final String kecamatan;
  final String kelurahan;
  final String kodePos;
  final String namaPerusahaan;
  final String alamatPerusahaan;
  final String jabatan;
  final String durasiKerja;
  final String sumberPendapatan;
  final String pendapatanKotor;
  final String namaBank;
  final String cabangBank;
  final String norek;
  final String namaRek;

  PersonalInfoState({
    required this.ktp_path,
    required this.nama,
    required this.noHp,
    required this.email,
    required this.selecteGender,
    required this.tanggalLahir,
    required this.selectedPendidikan,
    required this.selectedStatus,
    required this.processIdx,
    required this.nik,
    required this.alamatKTP,
    required this.provinsi,
    required this.kota,
    required this.kecamatan,
    required this.kelurahan,
    required this.kodePos,
    required this.namaPerusahaan,
    required this.alamatPerusahaan,
    required this.jabatan,
    required this.durasiKerja,
    required this.sumberPendapatan,
    required this.pendapatanKotor,
    required this.namaBank,
    required this.cabangBank,
    required this.norek,
    required this.namaRek,
  });
}

class PersonalInfoInitial extends PersonalInfoState {
  PersonalInfoInitial()
      : super(
          ktp_path: "",
          nama: "",
          noHp: "",
          email: "",
          selecteGender: "Laki-Laki",
          tanggalLahir: "",
          selectedPendidikan: "S1",
          selectedStatus: "Belum Kawin",
          processIdx: 0,
          nik: "",
          alamatKTP: "",
          provinsi: "Provinsi A",
          kota: "Kota A",
          kecamatan: "Kecamatan A",
          kelurahan: "Kelurahan A",
          kodePos: "",
          namaPerusahaan: "",
          alamatPerusahaan: "",
          jabatan: "Jabatan A",
          durasiKerja: "< 6 Bulan",
          sumberPendapatan: "Pendapatan A",
          pendapatanKotor: "< 10 Juta",
          namaBank: "Bank A",
          cabangBank: "",
          norek: "",
          namaRek: "",
        );
}

class PersonalInfoDoneSave extends PersonalInfoState {
  PersonalInfoDoneSave(PersonalInfoState state)
      : super(
          ktp_path: state.ktp_path,
          nama: state.nama,
          noHp: state.noHp,
          email: state.email,
          selecteGender: state.selecteGender,
          tanggalLahir: state.tanggalLahir,
          selectedPendidikan: state.selectedPendidikan,
          selectedStatus: state.selectedStatus,
          processIdx: state.processIdx,
          nik: state.nik,
          alamatKTP: state.alamatKTP,
          provinsi: state.provinsi,
          kota: state.kota,
          kecamatan: state.kecamatan,
          kelurahan: state.kelurahan,
          kodePos: state.kodePos,
          namaPerusahaan: state.namaPerusahaan,
          alamatPerusahaan: state.alamatPerusahaan,
          jabatan: state.jabatan,
          durasiKerja: state.durasiKerja,
          sumberPendapatan: state.sumberPendapatan,
          pendapatanKotor: state.pendapatanKotor,
          namaBank: state.namaBank,
          cabangBank: state.cabangBank,
          norek: state.norek,
          namaRek: state.namaRek,
        );
}

class PersonalInfoStateLoading extends PersonalInfoState {
  PersonalInfoStateLoading(PersonalInfoState state)
      : super(
          ktp_path: state.ktp_path,
          nama: state.nama,
          noHp: state.noHp,
          email: state.email,
          selecteGender: state.selecteGender,
          tanggalLahir: state.tanggalLahir,
          selectedPendidikan: state.selectedPendidikan,
          selectedStatus: state.selectedStatus,
          processIdx: state.processIdx,
          nik: state.nik,
          alamatKTP: state.alamatKTP,
          provinsi: state.provinsi,
          kota: state.kota,
          kecamatan: state.kecamatan,
          kelurahan: state.kelurahan,
          kodePos: state.kodePos,
          namaPerusahaan: state.namaPerusahaan,
          alamatPerusahaan: state.alamatPerusahaan,
          jabatan: state.jabatan,
          durasiKerja: state.durasiKerja,
          sumberPendapatan: state.sumberPendapatan,
          pendapatanKotor: state.pendapatanKotor,
          namaBank: state.namaBank,
          cabangBank: state.cabangBank,
          norek: state.norek,
          namaRek: state.namaRek,
        );
}
