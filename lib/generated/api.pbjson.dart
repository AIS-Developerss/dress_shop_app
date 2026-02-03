// This is a generated file - do not edit.
//
// Generated from api.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports
// ignore_for_file: unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use userDescriptor instead')
const User$json = {
  '1': 'User',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'phone', '3': 3, '4': 1, '5': 9, '10': 'phone'},
    {'1': 'email', '3': 4, '4': 1, '5': 9, '10': 'email'},
  ],
};

/// Descriptor for `User`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userDescriptor = $convert.base64Decode(
    'CgRVc2VyEg4KAmlkGAEgASgJUgJpZBISCgRuYW1lGAIgASgJUgRuYW1lEhQKBXBob25lGAMgAS'
    'gJUgVwaG9uZRIUCgVlbWFpbBgEIAEoCVIFZW1haWw=');

@$core.Deprecated('Use productDescriptor instead')
const Product$json = {
  '1': 'Product',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'price', '3': 3, '4': 1, '5': 9, '10': 'price'},
    {'1': 'description', '3': 4, '4': 1, '5': 9, '10': 'description'},
    {'1': 'image_paths', '3': 5, '4': 3, '5': 9, '10': 'imagePaths'},
    {'1': 'category_id', '3': 6, '4': 1, '5': 9, '10': 'categoryId'},
    {
      '1': 'characteristics',
      '3': 7,
      '4': 3,
      '5': 11,
      '6': '.dress_shop.v1.Product.CharacteristicsEntry',
      '10': 'characteristics'
    },
    {'1': 'available_sizes', '3': 8, '4': 3, '5': 9, '10': 'availableSizes'},
    {'1': 'stock', '3': 9, '4': 1, '5': 5, '10': 'stock'},
  ],
  '3': [Product_CharacteristicsEntry$json],
};

@$core.Deprecated('Use productDescriptor instead')
const Product_CharacteristicsEntry$json = {
  '1': 'CharacteristicsEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `Product`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List productDescriptor = $convert.base64Decode(
    'CgdQcm9kdWN0Eg4KAmlkGAEgASgJUgJpZBISCgRuYW1lGAIgASgJUgRuYW1lEhQKBXByaWNlGA'
    'MgASgJUgVwcmljZRIgCgtkZXNjcmlwdGlvbhgEIAEoCVILZGVzY3JpcHRpb24SHwoLaW1hZ2Vf'
    'cGF0aHMYBSADKAlSCmltYWdlUGF0aHMSHwoLY2F0ZWdvcnlfaWQYBiABKAlSCmNhdGVnb3J5SW'
    'QSVQoPY2hhcmFjdGVyaXN0aWNzGAcgAygLMisuZHJlc3Nfc2hvcC52MS5Qcm9kdWN0LkNoYXJh'
    'Y3RlcmlzdGljc0VudHJ5Ug9jaGFyYWN0ZXJpc3RpY3MSJwoPYXZhaWxhYmxlX3NpemVzGAggAy'
    'gJUg5hdmFpbGFibGVTaXplcxIUCgVzdG9jaxgJIAEoBVIFc3RvY2saQgoUQ2hhcmFjdGVyaXN0'
    'aWNzRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSFAoFdmFsdWUYAiABKAlSBXZhbHVlOgI4AQ==');

@$core.Deprecated('Use categoryDescriptor instead')
const Category$json = {
  '1': 'Category',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'icon', '3': 3, '4': 1, '5': 9, '10': 'icon'},
  ],
};

/// Descriptor for `Category`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List categoryDescriptor = $convert.base64Decode(
    'CghDYXRlZ29yeRIOCgJpZBgBIAEoCVICaWQSEgoEbmFtZRgCIAEoCVIEbmFtZRISCgRpY29uGA'
    'MgASgJUgRpY29u');

@$core.Deprecated('Use favoriteDescriptor instead')
const Favorite$json = {
  '1': 'Favorite',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'product_id', '3': 3, '4': 1, '5': 9, '10': 'productId'},
  ],
};

/// Descriptor for `Favorite`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List favoriteDescriptor = $convert.base64Decode(
    'CghGYXZvcml0ZRIOCgJpZBgBIAEoCVICaWQSFwoHdXNlcl9pZBgCIAEoCVIGdXNlcklkEh0KCn'
    'Byb2R1Y3RfaWQYAyABKAlSCXByb2R1Y3RJZA==');

@$core.Deprecated('Use orderItemDescriptor instead')
const OrderItem$json = {
  '1': 'OrderItem',
  '2': [
    {'1': 'product_id', '3': 1, '4': 1, '5': 9, '10': 'productId'},
    {'1': 'product_name', '3': 2, '4': 1, '5': 9, '10': 'productName'},
    {'1': 'size', '3': 3, '4': 1, '5': 9, '10': 'size'},
    {'1': 'quantity', '3': 4, '4': 1, '5': 5, '10': 'quantity'},
    {'1': 'price', '3': 5, '4': 1, '5': 9, '10': 'price'},
    {'1': 'image_path', '3': 6, '4': 1, '5': 9, '10': 'imagePath'},
  ],
};

/// Descriptor for `OrderItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List orderItemDescriptor = $convert.base64Decode(
    'CglPcmRlckl0ZW0SHQoKcHJvZHVjdF9pZBgBIAEoCVIJcHJvZHVjdElkEiEKDHByb2R1Y3Rfbm'
    'FtZRgCIAEoCVILcHJvZHVjdE5hbWUSEgoEc2l6ZRgDIAEoCVIEc2l6ZRIaCghxdWFudGl0eRgE'
    'IAEoBVIIcXVhbnRpdHkSFAoFcHJpY2UYBSABKAlSBXByaWNlEh0KCmltYWdlX3BhdGgYBiABKA'
    'lSCWltYWdlUGF0aA==');

@$core.Deprecated('Use orderDescriptor instead')
const Order$json = {
  '1': 'Order',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    {
      '1': 'items',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.dress_shop.v1.OrderItem',
      '10': 'items'
    },
    {'1': 'total_price', '3': 4, '4': 1, '5': 9, '10': 'totalPrice'},
    {'1': 'status', '3': 5, '4': 1, '5': 9, '10': 'status'},
    {'1': 'created_at', '3': 6, '4': 1, '5': 9, '10': 'createdAt'},
    {'1': 'delivery_address', '3': 7, '4': 1, '5': 9, '10': 'deliveryAddress'},
    {'1': 'phone', '3': 8, '4': 1, '5': 9, '10': 'phone'},
    {'1': 'name', '3': 9, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `Order`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List orderDescriptor = $convert.base64Decode(
    'CgVPcmRlchIOCgJpZBgBIAEoCVICaWQSFwoHdXNlcl9pZBgCIAEoCVIGdXNlcklkEi4KBWl0ZW'
    '1zGAMgAygLMhguZHJlc3Nfc2hvcC52MS5PcmRlckl0ZW1SBWl0ZW1zEh8KC3RvdGFsX3ByaWNl'
    'GAQgASgJUgp0b3RhbFByaWNlEhYKBnN0YXR1cxgFIAEoCVIGc3RhdHVzEh0KCmNyZWF0ZWRfYX'
    'QYBiABKAlSCWNyZWF0ZWRBdBIpChBkZWxpdmVyeV9hZGRyZXNzGAcgASgJUg9kZWxpdmVyeUFk'
    'ZHJlc3MSFAoFcGhvbmUYCCABKAlSBXBob25lEhIKBG5hbWUYCSABKAlSBG5hbWU=');

@$core.Deprecated('Use sendSmsRequestDescriptor instead')
const SendSmsRequest$json = {
  '1': 'SendSmsRequest',
  '2': [
    {'1': 'phone', '3': 1, '4': 1, '5': 9, '10': 'phone'},
  ],
};

/// Descriptor for `SendSmsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendSmsRequestDescriptor = $convert
    .base64Decode('Cg5TZW5kU21zUmVxdWVzdBIUCgVwaG9uZRgBIAEoCVIFcGhvbmU=');

@$core.Deprecated('Use sendSmsResponseDescriptor instead')
const SendSmsResponse$json = {
  '1': 'SendSmsResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `SendSmsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendSmsResponseDescriptor = $convert.base64Decode(
    'Cg9TZW5kU21zUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxIYCgdtZXNzYWdlGA'
    'IgASgJUgdtZXNzYWdl');

@$core.Deprecated('Use verifySmsRequestDescriptor instead')
const VerifySmsRequest$json = {
  '1': 'VerifySmsRequest',
  '2': [
    {'1': 'phone', '3': 1, '4': 1, '5': 9, '10': 'phone'},
    {'1': 'code', '3': 2, '4': 1, '5': 9, '10': 'code'},
  ],
};

/// Descriptor for `VerifySmsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verifySmsRequestDescriptor = $convert.base64Decode(
    'ChBWZXJpZnlTbXNSZXF1ZXN0EhQKBXBob25lGAEgASgJUgVwaG9uZRISCgRjb2RlGAIgASgJUg'
    'Rjb2Rl');

@$core.Deprecated('Use verifySmsResponseDescriptor instead')
const VerifySmsResponse$json = {
  '1': 'VerifySmsResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'token', '3': 2, '4': 1, '5': 9, '10': 'token'},
    {
      '1': 'user',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.dress_shop.v1.User',
      '10': 'user'
    },
  ],
};

/// Descriptor for `VerifySmsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verifySmsResponseDescriptor = $convert.base64Decode(
    'ChFWZXJpZnlTbXNSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNzEhQKBXRva2VuGA'
    'IgASgJUgV0b2tlbhInCgR1c2VyGAMgASgLMhMuZHJlc3Nfc2hvcC52MS5Vc2VyUgR1c2Vy');

@$core.Deprecated('Use registerRequestDescriptor instead')
const RegisterRequest$json = {
  '1': 'RegisterRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'phone', '3': 2, '4': 1, '5': 9, '10': 'phone'},
  ],
};

/// Descriptor for `RegisterRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerRequestDescriptor = $convert.base64Decode(
    'Cg9SZWdpc3RlclJlcXVlc3QSEgoEbmFtZRgBIAEoCVIEbmFtZRIUCgVwaG9uZRgCIAEoCVIFcG'
    'hvbmU=');

@$core.Deprecated('Use registerResponseDescriptor instead')
const RegisterResponse$json = {
  '1': 'RegisterResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `RegisterResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerResponseDescriptor = $convert.base64Decode(
    'ChBSZWdpc3RlclJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSGAoHbWVzc2FnZR'
    'gCIAEoCVIHbWVzc2FnZQ==');

@$core.Deprecated('Use getProductsRequestDescriptor instead')
const GetProductsRequest$json = {
  '1': 'GetProductsRequest',
  '2': [
    {'1': 'category_id', '3': 1, '4': 1, '5': 9, '10': 'categoryId'},
    {'1': 'search', '3': 2, '4': 1, '5': 9, '10': 'search'},
  ],
};

/// Descriptor for `GetProductsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getProductsRequestDescriptor = $convert.base64Decode(
    'ChJHZXRQcm9kdWN0c1JlcXVlc3QSHwoLY2F0ZWdvcnlfaWQYASABKAlSCmNhdGVnb3J5SWQSFg'
    'oGc2VhcmNoGAIgASgJUgZzZWFyY2g=');

@$core.Deprecated('Use getProductsResponseDescriptor instead')
const GetProductsResponse$json = {
  '1': 'GetProductsResponse',
  '2': [
    {
      '1': 'products',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.dress_shop.v1.Product',
      '10': 'products'
    },
  ],
};

/// Descriptor for `GetProductsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getProductsResponseDescriptor = $convert.base64Decode(
    'ChNHZXRQcm9kdWN0c1Jlc3BvbnNlEjIKCHByb2R1Y3RzGAEgAygLMhYuZHJlc3Nfc2hvcC52MS'
    '5Qcm9kdWN0Ughwcm9kdWN0cw==');

@$core.Deprecated('Use getProductRequestDescriptor instead')
const GetProductRequest$json = {
  '1': 'GetProductRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `GetProductRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getProductRequestDescriptor =
    $convert.base64Decode('ChFHZXRQcm9kdWN0UmVxdWVzdBIOCgJpZBgBIAEoCVICaWQ=');

@$core.Deprecated('Use getProductResponseDescriptor instead')
const GetProductResponse$json = {
  '1': 'GetProductResponse',
  '2': [
    {
      '1': 'product',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.dress_shop.v1.Product',
      '10': 'product'
    },
  ],
};

/// Descriptor for `GetProductResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getProductResponseDescriptor = $convert.base64Decode(
    'ChJHZXRQcm9kdWN0UmVzcG9uc2USMAoHcHJvZHVjdBgBIAEoCzIWLmRyZXNzX3Nob3AudjEuUH'
    'JvZHVjdFIHcHJvZHVjdA==');

@$core.Deprecated('Use getCategoriesRequestDescriptor instead')
const GetCategoriesRequest$json = {
  '1': 'GetCategoriesRequest',
};

/// Descriptor for `GetCategoriesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCategoriesRequestDescriptor =
    $convert.base64Decode('ChRHZXRDYXRlZ29yaWVzUmVxdWVzdA==');

@$core.Deprecated('Use getCategoriesResponseDescriptor instead')
const GetCategoriesResponse$json = {
  '1': 'GetCategoriesResponse',
  '2': [
    {
      '1': 'categories',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.dress_shop.v1.Category',
      '10': 'categories'
    },
  ],
};

/// Descriptor for `GetCategoriesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCategoriesResponseDescriptor = $convert.base64Decode(
    'ChVHZXRDYXRlZ29yaWVzUmVzcG9uc2USNwoKY2F0ZWdvcmllcxgBIAMoCzIXLmRyZXNzX3Nob3'
    'AudjEuQ2F0ZWdvcnlSCmNhdGVnb3JpZXM=');

@$core.Deprecated('Use getFavoritesRequestDescriptor instead')
const GetFavoritesRequest$json = {
  '1': 'GetFavoritesRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `GetFavoritesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getFavoritesRequestDescriptor =
    $convert.base64Decode(
        'ChNHZXRGYXZvcml0ZXNSZXF1ZXN0EhcKB3VzZXJfaWQYASABKAlSBnVzZXJJZA==');

@$core.Deprecated('Use getFavoritesResponseDescriptor instead')
const GetFavoritesResponse$json = {
  '1': 'GetFavoritesResponse',
  '2': [
    {
      '1': 'favorites',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.dress_shop.v1.Favorite',
      '10': 'favorites'
    },
  ],
};

/// Descriptor for `GetFavoritesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getFavoritesResponseDescriptor = $convert.base64Decode(
    'ChRHZXRGYXZvcml0ZXNSZXNwb25zZRI1CglmYXZvcml0ZXMYASADKAsyFy5kcmVzc19zaG9wLn'
    'YxLkZhdm9yaXRlUglmYXZvcml0ZXM=');

@$core.Deprecated('Use addFavoriteRequestDescriptor instead')
const AddFavoriteRequest$json = {
  '1': 'AddFavoriteRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'product_id', '3': 2, '4': 1, '5': 9, '10': 'productId'},
  ],
};

/// Descriptor for `AddFavoriteRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addFavoriteRequestDescriptor = $convert.base64Decode(
    'ChJBZGRGYXZvcml0ZVJlcXVlc3QSFwoHdXNlcl9pZBgBIAEoCVIGdXNlcklkEh0KCnByb2R1Y3'
    'RfaWQYAiABKAlSCXByb2R1Y3RJZA==');

@$core.Deprecated('Use addFavoriteResponseDescriptor instead')
const AddFavoriteResponse$json = {
  '1': 'AddFavoriteResponse',
  '2': [
    {
      '1': 'favorite',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.dress_shop.v1.Favorite',
      '10': 'favorite'
    },
  ],
};

/// Descriptor for `AddFavoriteResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addFavoriteResponseDescriptor = $convert.base64Decode(
    'ChNBZGRGYXZvcml0ZVJlc3BvbnNlEjMKCGZhdm9yaXRlGAEgASgLMhcuZHJlc3Nfc2hvcC52MS'
    '5GYXZvcml0ZVIIZmF2b3JpdGU=');

@$core.Deprecated('Use removeFavoriteRequestDescriptor instead')
const RemoveFavoriteRequest$json = {
  '1': 'RemoveFavoriteRequest',
  '2': [
    {'1': 'favorite_id', '3': 1, '4': 1, '5': 9, '10': 'favoriteId'},
  ],
};

/// Descriptor for `RemoveFavoriteRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List removeFavoriteRequestDescriptor = $convert.base64Decode(
    'ChVSZW1vdmVGYXZvcml0ZVJlcXVlc3QSHwoLZmF2b3JpdGVfaWQYASABKAlSCmZhdm9yaXRlSW'
    'Q=');

@$core.Deprecated('Use removeFavoriteResponseDescriptor instead')
const RemoveFavoriteResponse$json = {
  '1': 'RemoveFavoriteResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `RemoveFavoriteResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List removeFavoriteResponseDescriptor =
    $convert.base64Decode(
        'ChZSZW1vdmVGYXZvcml0ZVJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3M=');

@$core.Deprecated('Use createOrderRequestDescriptor instead')
const CreateOrderRequest$json = {
  '1': 'CreateOrderRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {
      '1': 'items',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.dress_shop.v1.OrderItem',
      '10': 'items'
    },
    {'1': 'delivery_address', '3': 3, '4': 1, '5': 9, '10': 'deliveryAddress'},
    {'1': 'phone', '3': 4, '4': 1, '5': 9, '10': 'phone'},
    {'1': 'name', '3': 5, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `CreateOrderRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createOrderRequestDescriptor = $convert.base64Decode(
    'ChJDcmVhdGVPcmRlclJlcXVlc3QSFwoHdXNlcl9pZBgBIAEoCVIGdXNlcklkEi4KBWl0ZW1zGA'
    'IgAygLMhguZHJlc3Nfc2hvcC52MS5PcmRlckl0ZW1SBWl0ZW1zEikKEGRlbGl2ZXJ5X2FkZHJl'
    'c3MYAyABKAlSD2RlbGl2ZXJ5QWRkcmVzcxIUCgVwaG9uZRgEIAEoCVIFcGhvbmUSEgoEbmFtZR'
    'gFIAEoCVIEbmFtZQ==');

@$core.Deprecated('Use createOrderResponseDescriptor instead')
const CreateOrderResponse$json = {
  '1': 'CreateOrderResponse',
  '2': [
    {
      '1': 'order',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.dress_shop.v1.Order',
      '10': 'order'
    },
  ],
};

/// Descriptor for `CreateOrderResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createOrderResponseDescriptor = $convert.base64Decode(
    'ChNDcmVhdGVPcmRlclJlc3BvbnNlEioKBW9yZGVyGAEgASgLMhQuZHJlc3Nfc2hvcC52MS5Pcm'
    'RlclIFb3JkZXI=');

@$core.Deprecated('Use getOrdersRequestDescriptor instead')
const GetOrdersRequest$json = {
  '1': 'GetOrdersRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `GetOrdersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getOrdersRequestDescriptor = $convert.base64Decode(
    'ChBHZXRPcmRlcnNSZXF1ZXN0EhcKB3VzZXJfaWQYASABKAlSBnVzZXJJZA==');

@$core.Deprecated('Use getOrdersResponseDescriptor instead')
const GetOrdersResponse$json = {
  '1': 'GetOrdersResponse',
  '2': [
    {
      '1': 'orders',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.dress_shop.v1.Order',
      '10': 'orders'
    },
  ],
};

/// Descriptor for `GetOrdersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getOrdersResponseDescriptor = $convert.base64Decode(
    'ChFHZXRPcmRlcnNSZXNwb25zZRIsCgZvcmRlcnMYASADKAsyFC5kcmVzc19zaG9wLnYxLk9yZG'
    'VyUgZvcmRlcnM=');

@$core.Deprecated('Use getOrderRequestDescriptor instead')
const GetOrderRequest$json = {
  '1': 'GetOrderRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `GetOrderRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getOrderRequestDescriptor =
    $convert.base64Decode('Cg9HZXRPcmRlclJlcXVlc3QSDgoCaWQYASABKAlSAmlk');

@$core.Deprecated('Use getOrderResponseDescriptor instead')
const GetOrderResponse$json = {
  '1': 'GetOrderResponse',
  '2': [
    {
      '1': 'order',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.dress_shop.v1.Order',
      '10': 'order'
    },
  ],
};

/// Descriptor for `GetOrderResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getOrderResponseDescriptor = $convert.base64Decode(
    'ChBHZXRPcmRlclJlc3BvbnNlEioKBW9yZGVyGAEgASgLMhQuZHJlc3Nfc2hvcC52MS5PcmRlcl'
    'IFb3JkZXI=');

@$core.Deprecated('Use sendContactMessageRequestDescriptor instead')
const SendContactMessageRequest$json = {
  '1': 'SendContactMessageRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'phone', '3': 2, '4': 1, '5': 9, '10': 'phone'},
    {'1': 'message', '3': 3, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `SendContactMessageRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendContactMessageRequestDescriptor =
    $convert.base64Decode(
        'ChlTZW5kQ29udGFjdE1lc3NhZ2VSZXF1ZXN0EhIKBG5hbWUYASABKAlSBG5hbWUSFAoFcGhvbm'
        'UYAiABKAlSBXBob25lEhgKB21lc3NhZ2UYAyABKAlSB21lc3NhZ2U=');

@$core.Deprecated('Use sendContactMessageResponseDescriptor instead')
const SendContactMessageResponse$json = {
  '1': 'SendContactMessageResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `SendContactMessageResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendContactMessageResponseDescriptor =
    $convert.base64Decode(
        'ChpTZW5kQ29udGFjdE1lc3NhZ2VSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNzEh'
        'gKB21lc3NhZ2UYAiABKAlSB21lc3NhZ2U=');
