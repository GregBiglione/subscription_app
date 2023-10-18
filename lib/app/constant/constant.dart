import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Image asset -----------------------------------------------------------------
const String imagePath = "assets/images";

// Firebase --------------------------------------------------------------------
FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;

// Url -------------------------------------------------------------------------
const String successUrl = "https://success.com";
const String cancelUrl = "https://cancel.com";

// String ----------------------------------------------------------------------
const String success = "Success";
const String cancel = "Cancel";