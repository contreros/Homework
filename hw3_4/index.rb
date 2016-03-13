require 'pp'
require_relative 'developer'
require_relative 'junior_developer'
require_relative 'senior_developer'
require_relative 'team'

MESSAGES = {
    junior: 'Отдали задачу "%s" разработчику %s, следите за ним!',
    senior: '%s сделает "%s", но просит больше с такими глупостями не приставать',
    developer: '%s сделает "%s", как положено'
}

team = Team.new do
  # создаём команду, описываем её в этом блоке
  # описываем, какие в команде есть разработчики
  have_seniors "Олег", "Оксана"
  have_developers "Олеся", "Василий", "Игорь-Богдан"
  have_juniors "Владислава", "Аркадий", "Рамеш"

  # описываем в каком порядке выдавать задачи:
  # * сначала любому джуниору
  # * потом любому обычному разработчику
  # * потом любому старшему
  priority :juniors, :developers, :seniors

  # описываем дополнительные действия, когда задача выдана джуну
  on_task :junior do |dev, task|
    puts MESSAGES[:junior] % [task, dev.name]
  end

  on_task :senior do |dev, task|
    puts MESSAGES[:senior] % [dev.name, task]
  end

  on_task :developer do |dev, task|
    puts MESSAGES[:developer] % [dev.name, task]
  end
end

pp team.all
#pp team.seniors

#pp team.developers
#pp team.juniors
# p team.priorities
#pp team.tasks_actions
#pp team.members
team.add_task 'Помыть окна', complexity: :developer, to: 'Василий'
team.add_task 'Помыть окна', complexity: :senior
team.add_task 'Помыть окна', to: 'Игорь-Богдан'

team.add_task 'таск 1'

team.add_task 'Налить чаю', to: 'Василий'

# team.add_task 'таск 2'
# team.add_task 'таск 3'
# team.add_task 'таск 4'
# team.add_task 'таск 5'
# team.add_task 'таск 6'
# team.add_task 'таск 7'
# team.add_task 'таск 8'
# team.add_task 'таск 9'
# team.add_task 'таск 10'


#pp team.all
team.report
# pp team.seniors
# pp team.developers
# pp team.juniors

###################
#dev = Developer.new('Вася')
#junior = JuniorDeveloper.new('Джун')
#senior = SeniorDeveloper.new('Сениор')

# senior.add_task('Сделать всё')
# senior.add_task('Залить всё')
# senior.add_task('Третья таска')
#
# senior.work!
# senior.work!
#p junior.status

#junior.add_task('Протереть экран ')
#junior.add_task('Почистить мышь')
#junior.add_task('Учиться')

#p junior.status

#junior.add_task('Учиться')
#junior.add_task('Учиться')

#p junior.status

# dev.add_task('Помыть машину')
# dev.add_task('Полить кактус')
# puts dev.tasks

#junior.add_task('Учиться')


#puts dev.status
#p dev.can_add_task?

# begin
#   dev.work!
# rescue Developer::EmptyTasks
#   puts 'нет задач же'
# end

#p dev.can_work?

# dev.add_task('Полить кактус')
# dev.add_task('Помыть машину')
# dev.add_task('Постирать')

#puts dev.status
#p dev.can_add_task?
#p dev.can_work?

#dev.work!
#dev.work!
#dev.work!

#p dev.can_work?

#puts dev.status
#p dev.can_add_task?



#puts dev.tasks

#dev.work!
#dev.work!
