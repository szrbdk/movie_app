import 'package:equatable/equatable.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();
}

class BeginEvent extends DashboardEvent {
  @override
  List<Object> get props => null;
}
