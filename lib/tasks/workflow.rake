namespace :doc do
  desc "Generate a workflow graph for a model passed e.g. as 'MODEL=Order'."
  task :workflow => :environment do
    require 'workflow/draw'
    Workflow::Draw::workflow_diagram(ENV['MODEL'].constantize, {
      path: '/Users/john/Code/fablabsio/fablabs',
      orientation: 'portrait',
      font: 'UbuntuMono-Regular'
    })
  end
end
