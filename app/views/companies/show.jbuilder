json.id @company.id
json.name @company.name
json.total_co2_produced @company.total_co2_produced
json.total_co2_captured @company.total_co2_captured

json.universal_tasks Task.universal do |task|
  company_task = task.get_company_task_for(@company.id)

  json.name task.name
  json.description task.description
  json.percent_done company_task.percent_done
end

json.tasks @company.company_tasks do |company_task|
  task = company_task.task

  json.name task.name
  json.description task.description
  json.percent_done company_task.percent_done
end
