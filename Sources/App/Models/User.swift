//
//  User.swift
//  App
//
//  Created by Leo Dion on 3/5/19.
//

import Authentication
import FluentPostgreSQL

final class User {
  var id: UUID?
  
  var name: String
  
  var passwordHash : String
  
  init(id: UUID? = nil, name: String, passwordHash: String) {
    self.id = id
    self.name = name
    self.passwordHash = passwordHash
  }
}

extension User : PostgreSQLUUIDModel {
  
}

extension User : PasswordAuthenticatable {
  static var usernameKey: WritableKeyPath<User, String> {
    return \.name
  }
  
  static var passwordKey: WritableKeyPath<User, String> {
    return \.passwordHash
  }
}

extension User : Migration {
  
}
