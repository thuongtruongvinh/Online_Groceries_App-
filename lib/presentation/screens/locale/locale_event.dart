abstract class LocaleEvent {}

class OnGetLocaleEvent extends LocaleEvent {}

class OnChangeLocaleEvent extends LocaleEvent {
  final String localeCode;

  OnChangeLocaleEvent(this.localeCode);
}
