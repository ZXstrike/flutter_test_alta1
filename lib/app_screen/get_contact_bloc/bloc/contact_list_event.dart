part of 'contact_list_bloc.dart';

abstract class ContactListEvent {
  const ContactListEvent();
}

class DeleteContactEvent extends ContactListEvent {
  final int index;

  DeleteContactEvent(this.index);
}

class UpdateContactEvent extends ContactListEvent {}

class EditContactEvent extends ContactListEvent {
  final int index;

  EditContactEvent(this.index);
}
