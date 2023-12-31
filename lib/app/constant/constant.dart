import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';

// Image asset -----------------------------------------------------------------
const String imagePath = "assets/images";

// Firebase --------------------------------------------------------------------
FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;

// Url -------------------------------------------------------------------------
const String successUrl = "https://success.com";
const String cancelUrl = "https://cancel.com";
const String stripePortalUrl = "https://europe-west6-shoesstore-d6003.cloudfunctions.net/ext-firestore-stripe-payments-bzjk-createPortalLink";

// String ----------------------------------------------------------------------
const String success = "Success";
const String cancel = "Cancel";

// Payment ---------------------------------------------------------------------
const String failedTitle = "Purchase failed!";
const String cancelTitle = "Purchase cancelled!";
const String successTitle = "Purchase successful!";
const String processPayment = "Processing payment...";

// Logger ----------------------------------------------------------------------
var logger = Logger();