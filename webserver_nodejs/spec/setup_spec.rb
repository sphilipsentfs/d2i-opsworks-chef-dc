require "chefspec"

describe "webserver_nodejs::setup" do
  before do
    stub_const('File::ALT_SEPARATOR', "\\")
  end

  let(:chef_runner) do
    ChefSpec::SoloRunner.new
  end

  let(:chef_run) do
    chef_runner.converge(described_recipe)
  end

  context "Webserver setup lifecycle event" do
    it "includes nodejs" do
      expect(chef_run).to include_recipe("opsworks_nodejs")
    end
  end
end
