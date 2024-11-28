import 'package:app_agendamento/app.dart';
import 'package:app_agendamento/core/flavor/flavor_config.dart';

void main() {
  bootstrap(Flavorconfig(
      flavor: AppFlavor.dev,
      baseUrl: 'https://parseapi.back4app.com/functions',
      appId: '0Gk6RwtZNXHESAnP6228EgL31qznm5luOJd6kXbB',
      restKey: 'Z68lqxOFneVHtrkt2oENZDDHHqeNslGS5C70lzGY'));
}
