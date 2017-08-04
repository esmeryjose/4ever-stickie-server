# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

notes1 = ["this is a note", "this is another note", "i want to fly", "we code everyday", "we are not broke anymore"]
notes2 = ["this is a short note", "this is another short note", "i want to swim in the ocean", "i wish i could code everyday", "we used to be very broke, now we are not"]
boards = ["random","boats"]

boards.each_with_index do |board,i|
  newBoard = Board.create(title: board)
  if i == 0
    notes1.each do |note|
      newBoard.notes << Note.create(content: note)
    end
  else
    notes2.each do |note|
      newBoard.notes << Note.create(content: note)
    end
  end
end
