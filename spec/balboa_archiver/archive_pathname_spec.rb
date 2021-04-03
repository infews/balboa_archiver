module BalboaArchiver
  RSpec.describe ArchivePathname do
    let(:archive_pathname) { BalboaArchiver::ArchivePathname.for(path) }

    context "for a filename that is nil" do
      let(:path) { nil }
      it "returns nil" do
        expect(archive_pathname).to be_nil
      end
    end

    context "for a filename that has no discernible date" do
      let(:path) { "foo-bar-baz.txt" }
      it "returns nil" do
        expect(archive_pathname).to be_nil
      end
    end

    context "for a filename that has paths" do
      let(:path) { "foo/bar/2021.03.21.myfilename.pdf" }
      it "ignores the directories" do
        expect(archive_pathname.basename.to_s).to eq(File.basename(path))
        expect(archive_pathname.dirname.to_s).to eq("2021/03.Mar")
      end
    end

    context "for a FileThis file name" do
      context "with the date at the end" do
        let(:path) { "Allstate Automobile 904150241 Statements 2018-07-12.pdf" }
        it "returns a new ArchivePathname" do
          expect(archive_pathname).to be_a(ArchivePathname)
        end

        it "returns a new name" do
          expect(archive_pathname.basename.to_s).to eq("2018.07.12.Allstate.Automobile.904150241.Statements.pdf")
        end

        it "has a directory" do
          expect(archive_pathname.dirname.to_s).to eq("2018/07.Jul")
        end
      end

      context "with more after the date" do
        let(:path) { "Allstate Automobile 904150241 Statements 2018-07-12 (1).pdf" }
        it "returns a new ArchivePathname" do
          expect(archive_pathname).to be_a(ArchivePathname)
        end

        it "returns a new name" do
          expect(archive_pathname.basename.to_s).to eq("2018.07.12.Allstate.Automobile.904150241.Statements.(1).pdf")
        end

        it "has a directory" do
          expect(archive_pathname.dirname.to_s).to eq("2018/07.Jul")
        end
      end
    end

    context "for a filename that is already in Balboa format" do
      let(:path) { "2021.03.21.myfilename.pdf" }

      it "returns a new ArchivePathname" do
        expect(archive_pathname).to be_a(ArchivePathname)
      end

      it "keeps the filename" do
        expect(archive_pathname.basename.to_s).to eq(path)
      end

      it "has a directory" do
        expect(archive_pathname.dirname.to_s).to eq("2021/03.Mar")
      end
    end

    context "for a filename that only has a leading year" do
      let(:path) { "2021.foo.bar.baz" }

      it "returns a new ArchivePathname" do
        expect(archive_pathname).to be_a(ArchivePathname)
      end

      it "keeps the filename" do
        expect(archive_pathname.basename.to_s).to eq(path)
      end

      it "has a directory" do
        expect(archive_pathname.dirname.to_s).to eq("2021")
      end
    end
  end
end
