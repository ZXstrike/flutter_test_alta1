part of 'contact_list_bloc.dart';

abstract class ContactListEvent {
  const ContactListEvent();
}

class AddContactEvent extends ContactListEvent {
  final ContactModel contact;

  AddContactEvent(this.contact);
}

class DeleteContactEvent extends ContactListEvent {
  final int index;

  DeleteContactEvent(this.index);
}

class ChangeContactEvent extends ContactListEvent {
  final int index;
  final ContactModel contact;

  ChangeContactEvent(this.contact, this.index);
}

class UpdateContactEvent extends ContactListEvent {}

class EditContactEvent extends ContactListEvent {
  final int index;

  EditContactEvent(this.index);
}
