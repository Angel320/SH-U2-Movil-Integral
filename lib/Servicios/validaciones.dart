class Validaciones {
  static String? validarCorreo(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingresa tu correo electrónico';
    }
     // Expresión regular para validar el formato del correo electrónico
    RegExp regExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!regExp.hasMatch(value)) {
      return 'Por favor ingresa un correo electrónico válido';
    }
    // se pueden agregar más validaciones aquí en caso de ser necesario
    return null;
  }

  static String? validarContrasena(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingresa tu contraseña';
    } else if (value.length < 6) {
      return 'La contraseña debe tener al menos 6 caracteres $value';
    }
    // se pueden agregar más validaciones aquí, según tus requisitos
    return null;
  }

  static String? confirmarContrasena(String? value, String? contrasena) {
    if (value == null || value.isEmpty) {
      return 'Por favor confirma tu contraseña';
    } else if (value != contrasena) {
      return 'Las contraseñas no coinciden $contrasena y $value';
    }
    return null;
  }
}
