
abstract class UrlState {}

class UrlInitial extends UrlState {}


class UrlFetchSuccess extends UrlState {}
class UrlFetchLoading extends UrlState {}
class UrlFetchFailure extends UrlState {}
class UrlChangeIndex extends UrlState{}
class UrlDelIndex extends UrlState{}