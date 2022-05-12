import 'dart:async';
import 'dart:io';
import 'dart:math';

// 变量
void variables() {
  print('\n');
  print('*' * 15);
  print('变量示例程序');
  print('*' * 15);

  var name = 'Voyager I';
  var year = 1977;
  var antennaDiameter = 3.7;
  var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
  var image = {
    'tags': ['saturn'],
    'url': '//path/to/saturn.jpg'
  };

  print(
      'name is $name, year is $year, antennaDiameter is $antennaDiameter, flybyObjects is $flybyObjects, image is $image');
}

// 控制流程 
void control_flow_statements() {
  print('\n');
  print('*' * 15);
  print('控制流程示例程序');
  print('*' * 15);

  var year = DateTime.now().year;

  if (year >= 2001) {
    print('21s centry');
  } else if (year >= 1901) {
    print('20th centry');
  }

  var flybyObjects = ['a', 'b', 'c'];
  for (final object in flybyObjects) {
    print(object);
  }

  for (int month = 1; month <= 12; month++) {
    print(month);
  }

  year = 2009;
  while (year < 2016) {
    year += 1;
    print(year);
  }
}

// 函数 
int fibonacci(int n) {
  if (n == 0 || n == 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

bool is_hit(String line, String target) {
  return line.contains(target);
}

void functions() {
  print('\n');
  print('*' * 15);
  print('函数示例程序');
  print('*' * 15);

  var fib = fibonacci(9);
  print('fib 9 is $fib');

  var flybyObjects = [
    'hello',
    'abc',
    '123',
    'how do you do',
    'nice to meet you'
  ];
  flybyObjects.where((name) => name.contains('you')).forEach(print);

  var hit_lines = flybyObjects.where((x) => is_hit(x, 'o'));
  for (var one in hit_lines) {
    print('one is $one');
  }
}

// 注释 
void comments() {
  print('\n');
  print('*' * 15);
  print('注释示例程序');
  print('*' * 15);

  /// 这是一个文档注释。
  /// 文档注释用于为库、类以及类的成员添加注释。
  /// 像 IDE 和 dartdoc 这样的工具可以专门处理文档注释。
  /* 也可以像这样使用单斜杠和星号的注释方式 */
  print('comments prints nothing.');
}

// 导入 
void imports() {
  print('\n');
  print('*' * 15);
  print('导入示例程序');
  print('*' * 15);

  var mypi = pi;
  print('pi is $mypi');

  var x = pi / 4;
  var y = sin(x);
  print('sin(pi/4) is $y');
}

// 类 
class Spacecraft {
  String name;
  DateTime launchDate;

  int get launchYear => launchDate?.year;

  Spacecraft(this.name, this.launchDate) {
  }

  Spacecraft.unlaunched(String name) : this(name, null);

  void describe() {
    print('Spacecraft: $name');

    var launchDate = this.launchDate;
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print('Launched: $launchYear ($years years ago)');
    } else {
      print('Unlaunched');
    }
  }
}

void classes() {
  print('\n');
  print('*' * 15);
  print('类示例程序');
  print('*' * 15);

  var voyager = Spacecraft('Voyager I', DateTime(1977, 9, 5));
  var voyager3 = Spacecraft.unlaunched('Voyager III');

  voyager.describe();
  voyager3.describe();
}

// 扩展类（继承）
class Orbiter extends Spacecraft {
  double altitude;

  Orbiter(String name, DateTime launchDate, this.altitude)
      : super(name, launchDate);

  @override
  void describe() {
    super.describe();
    print('altitude is $altitude km');
  }
}

void inheritance() {
  print('\n');
  print('*' * 15);
  print('扩展类（继承）示例程序');
  print('*' * 15);

  var obt = Orbiter('天宫号', DateTime(2021, 4, 29), 389.2);
  obt.describe();
}

// Mixins
mixin Piloted {
  int astronauts = 1;

  void describeCrew() {
    print('Number of astronauts: $astronauts');
  }
}

class PilotedCraft extends Spacecraft with Piloted {
  PilotedCraft(String name, DateTime launchDate) : super(name, launchDate);
}

void mixins() {
  print('\n');
  print('*' * 15);
  print('Mixins示例程序');
  print('*' * 15);

  var plt = PilotedCraft('神舟1号', DateTime(1999, 11, 20));
  plt.describe();
  plt.describeCrew();
}

// 接口和抽象类
class MockSpaceship implements Spacecraft {
  @override
  DateTime launchDate;

  @override
  String name;

  MockSpaceship(this.name, this.launchDate);

  @override
  void describe() {
    print('Mock Spacecraft: $name');
  }

  @override
  int get launchYear => launchDate?.year;
}

void interface_and_abstract_classes() {
  print('\n');
  print('*' * 15);
  print('接口和抽象类示例程序');
  print('*' * 15);

  var mock = MockSpaceship('测试飞行器', null);
  mock.describe();
}

// 异步 
Future<void> the_async() async {
  print('\n');
  print('*' * 15);
  print('异步');
  print('*' * 15);

  const oneSecond = Duration(seconds: 1);

  Future<void> printWithDelay1(String message) async {
    await Future.delayed(oneSecond);
    print(message);
  }

  printWithDelay1('过了1秒钟. 1');
  print('done 1.');

  Future<void> printWithDelay2(String message) {
    return Future.delayed(oneSecond).then((_) {
      print(message);
    });
  }

  printWithDelay2('过了1秒钟. 2');
  print('done 2.');

  Future<void> createDescriptions(Iterable<String> objects) async {
    for (final object in objects) {
      try {
        var file = File('$object.txt');
        if (await file.exists()) {
          var modified = await file.lastModified();
          print(
              'File for $object already exists. It was modified on $modified.');
          continue;
        }
        await file.create();
        await file.writeAsString('Start Describing $object in this file.');
        print('File for $object created.');
      } on IOException catch (e) {
        print('Cannot create description for $object: $e');
      }
    }
  }

  var the_objects = ['飞机', '火箭', '铲土车'];
  createDescriptions(the_objects);

  await Future.delayed(Duration(seconds: 5));
}

// Stream 
Future<void> the_stream() async {
  print('\n');
  print('*' * 15);
  print('Stream示例程序');
  print('*' * 15);

  const oneSecond = Duration(seconds: 1);

  StreamController<double> ctl = StreamController<double>();
  Stream stm = ctl.stream;

  stm.listen((event) {
    print('event from controller is: $event');
  });

  Future<void> addWithDelay(value) async {
    await Future.delayed(oneSecond);
    ctl.add(value);
  }

  addWithDelay(11.1);
  addWithDelay(22.2);
  addWithDelay(33.3);

  await Future.delayed(Duration(seconds: 5));
}

// 异常 
Future<void> show_descriptions(flybyObjects) async {
  try {
    for (final object in flybyObjects) {
      var description = await File('$object.txt').readAsString();
      print(description);
    }
  } on IOException catch (ex) {
    print('Could not describe object: $ex');
  } finally {
    flybyObjects.clear();
  }
}

void exceptions() {
  print('\n');
  print('*' * 15);
  print('异常示例程序');
  print('*' * 15);

  var flybyObjects = ['飞机', '火箭', '铲土车', '手机'];
  show_descriptions(flybyObjects);
}

Future<void> main(List<String> args) async {
  // 变量
  variables();

  // 控制流程
  control_flow_statements();

  // 函数
  functions();

  // 注释
  comments();

  // 导入
  imports();

  // 类
  classes();

  // 扩展类（继承）
  inheritance();

  // Mixins
  mixins();

  // 接口和抽象类
  interface_and_abstract_classes();

  // 异步
  await the_async();

  // Steam
  await the_stream();

  // 异常
  exceptions();
}