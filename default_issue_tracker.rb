[
  {name:"Low", "position"=>1, is_default:false, active:true, position_name:"lowest"},
  {name:"Normal", "position"=>2, is_default:true, active:true, position_name:"default"},
  {name:"High", "position"=>3, is_default:false, active:true, position_name:"high2"},
  {name:"Critical", "position"=>4, is_default:false, active:true, position_name:"highest"}
].each { |attr| puts IssuePriority.create!(attr).inspect }

puts IssueStatus.create!(name: "New", is_closed: false, position: 1).inspect
puts IssueStatus.create!(name: "In progress", is_closed: false, position: 2).inspect
puts IssueStatus.create!(name: "Done", is_closed: true, position: 3).inspect

puts Tracker.create!(name: "Default", is_in_chlog: false, position: 1, is_in_roadmap: true, fields_bits: 0, default_status_id: 1).inspect
