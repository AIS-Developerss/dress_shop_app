// This is a generated file - do not edit.
//
// Generated from api.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'api.pb.dart' as $0;

export 'api.pb.dart';

@$pb.GrpcServiceName('dress_shop.v1.AuthService')
class AuthServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  AuthServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.SendSmsResponse> sendSms(
    $0.SendSmsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$sendSms, request, options: options);
  }

  $grpc.ResponseFuture<$0.VerifySmsResponse> verifySms(
    $0.VerifySmsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$verifySms, request, options: options);
  }

  $grpc.ResponseFuture<$0.RegisterResponse> register(
    $0.RegisterRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$register, request, options: options);
  }

  // method descriptors

  static final _$sendSms =
      $grpc.ClientMethod<$0.SendSmsRequest, $0.SendSmsResponse>(
          '/dress_shop.v1.AuthService/SendSms',
          ($0.SendSmsRequest value) => value.writeToBuffer(),
          $0.SendSmsResponse.fromBuffer);
  static final _$verifySms =
      $grpc.ClientMethod<$0.VerifySmsRequest, $0.VerifySmsResponse>(
          '/dress_shop.v1.AuthService/VerifySms',
          ($0.VerifySmsRequest value) => value.writeToBuffer(),
          $0.VerifySmsResponse.fromBuffer);
  static final _$register =
      $grpc.ClientMethod<$0.RegisterRequest, $0.RegisterResponse>(
          '/dress_shop.v1.AuthService/Register',
          ($0.RegisterRequest value) => value.writeToBuffer(),
          $0.RegisterResponse.fromBuffer);
}

@$pb.GrpcServiceName('dress_shop.v1.AuthService')
abstract class AuthServiceBase extends $grpc.Service {
  $core.String get $name => 'dress_shop.v1.AuthService';

  AuthServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.SendSmsRequest, $0.SendSmsResponse>(
        'SendSms',
        sendSms_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SendSmsRequest.fromBuffer(value),
        ($0.SendSmsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.VerifySmsRequest, $0.VerifySmsResponse>(
        'VerifySms',
        verifySms_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.VerifySmsRequest.fromBuffer(value),
        ($0.VerifySmsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RegisterRequest, $0.RegisterResponse>(
        'Register',
        register_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RegisterRequest.fromBuffer(value),
        ($0.RegisterResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.SendSmsResponse> sendSms_Pre($grpc.ServiceCall $call,
      $async.Future<$0.SendSmsRequest> $request) async {
    return sendSms($call, await $request);
  }

  $async.Future<$0.SendSmsResponse> sendSms(
      $grpc.ServiceCall call, $0.SendSmsRequest request);

  $async.Future<$0.VerifySmsResponse> verifySms_Pre($grpc.ServiceCall $call,
      $async.Future<$0.VerifySmsRequest> $request) async {
    return verifySms($call, await $request);
  }

  $async.Future<$0.VerifySmsResponse> verifySms(
      $grpc.ServiceCall call, $0.VerifySmsRequest request);

  $async.Future<$0.RegisterResponse> register_Pre($grpc.ServiceCall $call,
      $async.Future<$0.RegisterRequest> $request) async {
    return register($call, await $request);
  }

  $async.Future<$0.RegisterResponse> register(
      $grpc.ServiceCall call, $0.RegisterRequest request);
}

@$pb.GrpcServiceName('dress_shop.v1.ProductService')
class ProductServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  ProductServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.GetProductsResponse> getProducts(
    $0.GetProductsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getProducts, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetProductResponse> getProduct(
    $0.GetProductRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getProduct, request, options: options);
  }

  // method descriptors

  static final _$getProducts =
      $grpc.ClientMethod<$0.GetProductsRequest, $0.GetProductsResponse>(
          '/dress_shop.v1.ProductService/GetProducts',
          ($0.GetProductsRequest value) => value.writeToBuffer(),
          $0.GetProductsResponse.fromBuffer);
  static final _$getProduct =
      $grpc.ClientMethod<$0.GetProductRequest, $0.GetProductResponse>(
          '/dress_shop.v1.ProductService/GetProduct',
          ($0.GetProductRequest value) => value.writeToBuffer(),
          $0.GetProductResponse.fromBuffer);
}

@$pb.GrpcServiceName('dress_shop.v1.ProductService')
abstract class ProductServiceBase extends $grpc.Service {
  $core.String get $name => 'dress_shop.v1.ProductService';

  ProductServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$0.GetProductsRequest, $0.GetProductsResponse>(
            'GetProducts',
            getProducts_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.GetProductsRequest.fromBuffer(value),
            ($0.GetProductsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetProductRequest, $0.GetProductResponse>(
        'GetProduct',
        getProduct_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetProductRequest.fromBuffer(value),
        ($0.GetProductResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetProductsResponse> getProducts_Pre($grpc.ServiceCall $call,
      $async.Future<$0.GetProductsRequest> $request) async {
    return getProducts($call, await $request);
  }

  $async.Future<$0.GetProductsResponse> getProducts(
      $grpc.ServiceCall call, $0.GetProductsRequest request);

  $async.Future<$0.GetProductResponse> getProduct_Pre($grpc.ServiceCall $call,
      $async.Future<$0.GetProductRequest> $request) async {
    return getProduct($call, await $request);
  }

  $async.Future<$0.GetProductResponse> getProduct(
      $grpc.ServiceCall call, $0.GetProductRequest request);
}

@$pb.GrpcServiceName('dress_shop.v1.CategoryService')
class CategoryServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  CategoryServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.GetCategoriesResponse> getCategories(
    $0.GetCategoriesRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getCategories, request, options: options);
  }

  // method descriptors

  static final _$getCategories =
      $grpc.ClientMethod<$0.GetCategoriesRequest, $0.GetCategoriesResponse>(
          '/dress_shop.v1.CategoryService/GetCategories',
          ($0.GetCategoriesRequest value) => value.writeToBuffer(),
          $0.GetCategoriesResponse.fromBuffer);
}

@$pb.GrpcServiceName('dress_shop.v1.CategoryService')
abstract class CategoryServiceBase extends $grpc.Service {
  $core.String get $name => 'dress_shop.v1.CategoryService';

  CategoryServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$0.GetCategoriesRequest, $0.GetCategoriesResponse>(
            'GetCategories',
            getCategories_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.GetCategoriesRequest.fromBuffer(value),
            ($0.GetCategoriesResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetCategoriesResponse> getCategories_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.GetCategoriesRequest> $request) async {
    return getCategories($call, await $request);
  }

  $async.Future<$0.GetCategoriesResponse> getCategories(
      $grpc.ServiceCall call, $0.GetCategoriesRequest request);
}

@$pb.GrpcServiceName('dress_shop.v1.FavoriteService')
class FavoriteServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  FavoriteServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.GetFavoritesResponse> getFavorites(
    $0.GetFavoritesRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getFavorites, request, options: options);
  }

  $grpc.ResponseFuture<$0.AddFavoriteResponse> addFavorite(
    $0.AddFavoriteRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$addFavorite, request, options: options);
  }

  $grpc.ResponseFuture<$0.RemoveFavoriteResponse> removeFavorite(
    $0.RemoveFavoriteRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$removeFavorite, request, options: options);
  }

  // method descriptors

  static final _$getFavorites =
      $grpc.ClientMethod<$0.GetFavoritesRequest, $0.GetFavoritesResponse>(
          '/dress_shop.v1.FavoriteService/GetFavorites',
          ($0.GetFavoritesRequest value) => value.writeToBuffer(),
          $0.GetFavoritesResponse.fromBuffer);
  static final _$addFavorite =
      $grpc.ClientMethod<$0.AddFavoriteRequest, $0.AddFavoriteResponse>(
          '/dress_shop.v1.FavoriteService/AddFavorite',
          ($0.AddFavoriteRequest value) => value.writeToBuffer(),
          $0.AddFavoriteResponse.fromBuffer);
  static final _$removeFavorite =
      $grpc.ClientMethod<$0.RemoveFavoriteRequest, $0.RemoveFavoriteResponse>(
          '/dress_shop.v1.FavoriteService/RemoveFavorite',
          ($0.RemoveFavoriteRequest value) => value.writeToBuffer(),
          $0.RemoveFavoriteResponse.fromBuffer);
}

@$pb.GrpcServiceName('dress_shop.v1.FavoriteService')
abstract class FavoriteServiceBase extends $grpc.Service {
  $core.String get $name => 'dress_shop.v1.FavoriteService';

  FavoriteServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$0.GetFavoritesRequest, $0.GetFavoritesResponse>(
            'GetFavorites',
            getFavorites_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.GetFavoritesRequest.fromBuffer(value),
            ($0.GetFavoritesResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.AddFavoriteRequest, $0.AddFavoriteResponse>(
            'AddFavorite',
            addFavorite_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.AddFavoriteRequest.fromBuffer(value),
            ($0.AddFavoriteResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RemoveFavoriteRequest,
            $0.RemoveFavoriteResponse>(
        'RemoveFavorite',
        removeFavorite_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.RemoveFavoriteRequest.fromBuffer(value),
        ($0.RemoveFavoriteResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetFavoritesResponse> getFavorites_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.GetFavoritesRequest> $request) async {
    return getFavorites($call, await $request);
  }

  $async.Future<$0.GetFavoritesResponse> getFavorites(
      $grpc.ServiceCall call, $0.GetFavoritesRequest request);

  $async.Future<$0.AddFavoriteResponse> addFavorite_Pre($grpc.ServiceCall $call,
      $async.Future<$0.AddFavoriteRequest> $request) async {
    return addFavorite($call, await $request);
  }

  $async.Future<$0.AddFavoriteResponse> addFavorite(
      $grpc.ServiceCall call, $0.AddFavoriteRequest request);

  $async.Future<$0.RemoveFavoriteResponse> removeFavorite_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.RemoveFavoriteRequest> $request) async {
    return removeFavorite($call, await $request);
  }

  $async.Future<$0.RemoveFavoriteResponse> removeFavorite(
      $grpc.ServiceCall call, $0.RemoveFavoriteRequest request);
}

@$pb.GrpcServiceName('dress_shop.v1.OrderService')
class OrderServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  OrderServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.CreateOrderResponse> createOrder(
    $0.CreateOrderRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$createOrder, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetOrdersResponse> getOrders(
    $0.GetOrdersRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getOrders, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetOrderResponse> getOrder(
    $0.GetOrderRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getOrder, request, options: options);
  }

  // method descriptors

  static final _$createOrder =
      $grpc.ClientMethod<$0.CreateOrderRequest, $0.CreateOrderResponse>(
          '/dress_shop.v1.OrderService/CreateOrder',
          ($0.CreateOrderRequest value) => value.writeToBuffer(),
          $0.CreateOrderResponse.fromBuffer);
  static final _$getOrders =
      $grpc.ClientMethod<$0.GetOrdersRequest, $0.GetOrdersResponse>(
          '/dress_shop.v1.OrderService/GetOrders',
          ($0.GetOrdersRequest value) => value.writeToBuffer(),
          $0.GetOrdersResponse.fromBuffer);
  static final _$getOrder =
      $grpc.ClientMethod<$0.GetOrderRequest, $0.GetOrderResponse>(
          '/dress_shop.v1.OrderService/GetOrder',
          ($0.GetOrderRequest value) => value.writeToBuffer(),
          $0.GetOrderResponse.fromBuffer);
}

@$pb.GrpcServiceName('dress_shop.v1.OrderService')
abstract class OrderServiceBase extends $grpc.Service {
  $core.String get $name => 'dress_shop.v1.OrderService';

  OrderServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$0.CreateOrderRequest, $0.CreateOrderResponse>(
            'CreateOrder',
            createOrder_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.CreateOrderRequest.fromBuffer(value),
            ($0.CreateOrderResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetOrdersRequest, $0.GetOrdersResponse>(
        'GetOrders',
        getOrders_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetOrdersRequest.fromBuffer(value),
        ($0.GetOrdersResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetOrderRequest, $0.GetOrderResponse>(
        'GetOrder',
        getOrder_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetOrderRequest.fromBuffer(value),
        ($0.GetOrderResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.CreateOrderResponse> createOrder_Pre($grpc.ServiceCall $call,
      $async.Future<$0.CreateOrderRequest> $request) async {
    return createOrder($call, await $request);
  }

  $async.Future<$0.CreateOrderResponse> createOrder(
      $grpc.ServiceCall call, $0.CreateOrderRequest request);

  $async.Future<$0.GetOrdersResponse> getOrders_Pre($grpc.ServiceCall $call,
      $async.Future<$0.GetOrdersRequest> $request) async {
    return getOrders($call, await $request);
  }

  $async.Future<$0.GetOrdersResponse> getOrders(
      $grpc.ServiceCall call, $0.GetOrdersRequest request);

  $async.Future<$0.GetOrderResponse> getOrder_Pre($grpc.ServiceCall $call,
      $async.Future<$0.GetOrderRequest> $request) async {
    return getOrder($call, await $request);
  }

  $async.Future<$0.GetOrderResponse> getOrder(
      $grpc.ServiceCall call, $0.GetOrderRequest request);
}

@$pb.GrpcServiceName('dress_shop.v1.ContactService')
class ContactServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  ContactServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.SendContactMessageResponse> sendContactMessage(
    $0.SendContactMessageRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$sendContactMessage, request, options: options);
  }

  // method descriptors

  static final _$sendContactMessage = $grpc.ClientMethod<
          $0.SendContactMessageRequest, $0.SendContactMessageResponse>(
      '/dress_shop.v1.ContactService/SendContactMessage',
      ($0.SendContactMessageRequest value) => value.writeToBuffer(),
      $0.SendContactMessageResponse.fromBuffer);
}

@$pb.GrpcServiceName('dress_shop.v1.ContactService')
abstract class ContactServiceBase extends $grpc.Service {
  $core.String get $name => 'dress_shop.v1.ContactService';

  ContactServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.SendContactMessageRequest,
            $0.SendContactMessageResponse>(
        'SendContactMessage',
        sendContactMessage_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.SendContactMessageRequest.fromBuffer(value),
        ($0.SendContactMessageResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.SendContactMessageResponse> sendContactMessage_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.SendContactMessageRequest> $request) async {
    return sendContactMessage($call, await $request);
  }

  $async.Future<$0.SendContactMessageResponse> sendContactMessage(
      $grpc.ServiceCall call, $0.SendContactMessageRequest request);
}
