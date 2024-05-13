// ignore_for_file: public_member_api_docs, sort_constructors_first
class Paginated<T> {
  List<T> itens;

  final int total;
  final int limit;
  final int? nextPage;
  final int? previousPage;
  final int pages;

  Paginated({
    required this.itens,
    required this.total,
    required this.limit,
    required this.nextPage,
    required this.previousPage,
    required this.pages,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': itens.map((x) => (x as dynamic)?.toMap()).toList(),
      'pagination': {
        'total': total, //total de registros
        'limit': limit, //limit por pagina, fixo 50
        'next_page': nextPage, //próxima pagina
        'previus_page': previousPage, //pagina anterior
        'pages': pages,
      },
    };
  }

  factory Paginated.fromMap(Map<String, dynamic> map, String name, T Function(Map<String, dynamic>) fromM) {
    return Paginated<T>(
      itens: map[name]
          .map<T>(
            (x) => fromM(x as Map<String, dynamic>),
          )
          .toList(),
      total: map['pagination']['total'] as int,
      limit: map['pagination']['limit'] as int,
      nextPage: map['pagination']['nextPage'] as int?,
      previousPage: map['pagination']['previousPage'] as int?,
      pages: map['pagination']['pages'] as int,
    );
  }
}
