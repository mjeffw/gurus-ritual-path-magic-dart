import 'package:gurps_ritual_path_magic_model/src/modifier/ritual_modifier.dart';
import 'package:meta/meta.dart';

import 'level.dart';
import 'modifier_component.dart';
import 'path_effect.dart';

@immutable
class Ritual {
  const Ritual({this.name, this.effects, List<RitualModifier> modifiers})
      : this.modifiers = modifiers ?? const <RitualModifier>[];

  final String name;

  final List<PathEffect> effects;

  final List<RitualModifier> modifiers;

  int get greaterEffects =>
      effects.where((it) => it.level == Level.greater).length;

  int get effectsMultiplier => 1 + (greaterEffects * 2);

  int get energyCost {
    int cost = effects.fold(
        0, (previousValue, element) => previousValue + element.cost);
    cost = modifiers.fold(
        cost, (previousValue, element) => previousValue + element.energyCost);
    return cost * effectsMultiplier;
  }

  Ritual addModifier(RitualModifier modifier) => Ritual(
      name: this.name,
      effects: this.effects,
      modifiers: [...modifiers, if (modifier != null) modifier]);

  Ritual addPathEffect(PathEffect effect) => Ritual(
      name: this.name,
      effects: [...this.effects, if (effect != null) effect],
      modifiers: this.modifiers);
}
