class ServiceConstants {
  static final ServiceConstants _instance = ServiceConstants._init();
  static ServiceConstants get instance => _instance;
  ServiceConstants._init();

  String get baseUrl => 'https://www.cheapshark.com/api/1.0/deals';
  int get pageSize => 25;
}
