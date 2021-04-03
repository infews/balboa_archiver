module BalboaArchiver
  RSpec.describe RenameMap do
    let(:map) { BalboaArchiver::RenameMap.from(source_paths, &naming_block) }
    let(:dst_parent) { "foo/bar" }
    let(:naming_block) { ->(dst_rename) { Pathname(dst_parent) + Pathname(dst_rename) } }

    describe "factory" do
      context "when no block is given"

      context "for a nil path" do
        let(:source_paths) { nil }
        it "returns an empty array" do
          expect(map.length).to eq(0)
        end
      end

      context "for a single path" do
        context "when the file is not rename-able" do
          let(:source_paths) { "barbaz" }

          it "returns an empty array" do
            expect(map.length).to eq(0)
          end
        end

        context "when the file is rename-able" do
          let(:source_paths) { "2021.03.31.foo" }
          it "returns an array of one" do
            expect(map.length).to eq(1)
          end
        end
      end

      context "for multiple paths" do
        let(:source_paths) { ["2021.03.31.foo", "barbaz", "2020-01-17.quux"] }

        it "returns entries for only the files it can rename" do
          expect(map.length).to eq(2)
        end

        it "sorts the results by destination" do
          expect(map.first.src).to eq(Pathname(source_paths[2]))
          expect(map[1].src).to eq(Pathname(source_paths.first))
        end

        it "yields to set the destination name" do
          expect(map[1].dst).to eq(Pathname(dst_parent) + Pathname("2021/03.Mar") + Pathname(source_paths.first))
        end
      end
    end
  end
end
