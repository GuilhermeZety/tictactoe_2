enum Stats {
  active,
  inactive,
  defaulter;

  String get name {
    switch (this) {
      case Stats.active:
        return 'ativo';
      case Stats.inactive:
        return 'inativo';
      case Stats.defaulter:
        return 'inadimplente';
    }
  }

  static Stats fromName(String? name) {
    switch (name?.toLowerCase()) {
      case 'ativo':
        return Stats.active;
      case 'inativo':
        return Stats.inactive;
      case 'inadimplente':
        return Stats.defaulter;
      default:
        return Stats.active;
    }
  }
}
