admin = Admin.find_by(email: 'admin@testguru.ru') || Admin.create(
  email: 'admin@testguru.ru',
  password: '123456',
  first_name: 'Администратор',
  last_name: 'Системы'
)

back, front, devops = %w[backend frontend devops].map { |title| Category.find_or_create_by(title: title) }

tests = Test.create!(
  [
    { title: 'Ruby', level: 1, category: back, author: admin },
    { title: 'PHP', level: 2, category: back, author: admin },
    { title: 'AngularJS', level: 3, category: front, author: admin },
    { title: 'CSS', level: 2, category: front, author: admin },
    { title: 'Linux', level: 1, category: devops, author: admin }
  ]
)

questions = Question.create!(
  [
    { body: 'Назовите метод, позволяющий добавить в массив новое значение', test: tests[0] },
    { body: 'Какой вид типизации используется в языке Ruby?', test: tests[0] },
    { body: 'Кто автор языка Ruby?', test: tests[0] },
    { body: 'Какой сервис используется в Angular для работы с RESTful API?', test: tests[2] },
    { body: 'Для каких целей используется селектор + ?', test: tests[3] },
    { body: 'Какой командой можно посмотреть список файлов текущего каталога?', test: tests[4] }
  ]
)

answers = Answer.create(
  [
    { body: 'pop', question: questions[0], correct: false },
    { body: 'push', question: questions[0], correct: true },
    { body: 'insert', question: questions[0], correct: true },

    { body: 'Статическая типизация', question: questions[1], correct: false  },
    { body: 'Динамическая типизация', question: questions[1], correct: true },
    { body: 'Строгая типизация', question: questions[1], correct: true },

    { body: 'Matz', question: questions[2], correct: true },
    { body: 'DHH', question: questions[2], correct: false  },
    { body: 'Google', question: questions[2], correct: false  },

    { body: '$scope', question: questions[3], correct: false  },
    { body: '$resource', question: questions[3], correct: true },
    { body: '$http', question: questions[3], correct: true },

    { body: 'Выбирает элемент, который находится непосредственно после указанного \
элемента, если у них общий родитель', question: questions[4], correct: true },
    { body: 'Выбирает элементы, которые являются дочерними непосредственно по \
отношению к указанному элементу', question: questions[4], correct: false  },
    { body: 'Выбирает элементы, которые находятся после указанного элемента, \
если у них общий родитель', question: questions[4], correct: false  },

    { body: 'cat', question: questions[5], correct: false  },
    { body: 'ls', question: questions[5], correct: true },
    { body: 'cp', question: questions[5], correct: false  }
  ]
)