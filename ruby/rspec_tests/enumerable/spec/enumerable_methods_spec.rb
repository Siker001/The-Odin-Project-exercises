require "enumerable_methods"

describe Enumerable do

	let(:empty) {[]}
	let(:arr) { [1,2,3,4,5,6] }
	
	describe ".my_each" do
		context "when no block given" do
			it "returns same array" do
				expect(arr.my_each()).to eql([1,2,3,4,5,6])
			end
		end

		context "gives array and block" do
			it "returns modified array by block" do
				a = []
				b = [2,4,6,8,10,12]
				expect(arr.my_each { |i| a << i * 2 } ).to eql(arr)
				expect(a).to eql(b)
			end
		end
	end

	describe ".my_select" do
		context "when block is given" do
			it "returns everything for the block is true" do
				expect(empty.my_select { |i| i == i }).to eql(empty)
				expect(arr.my_select { |i| i == i }).to eql(arr)
				expect(arr.my_select { |i| i == 2 }).to eql([2])
				expect(arr.my_select { |i| i % 2 == 0 }).to eql([2,4,6])
			end
		end
	end

	describe ".my_all?" do
		context "when array is empty" do
			it "returns true" do
				expect(empty.my_all? { |i| i }).to eql(true)
			end
		end

		context "when no block" do
			it "return true" do
				expect(arr.my_all?()).to eql(true)
			end
		end

		context "block given" do
			it "returns true" do
				expect(arr.my_all? { |i| i > 0 }).to eql(true)
				expect(arr.my_all? { |i| i < 10 }).to eql(true)
				expect(arr.my_all? { |i| i.integer? }).to eql(true)
			end

			it "returns false" do
				expect(arr.my_all? { |i| i < 0 }).to eql(false)
				expect(arr.my_all? { |i| i >= 4 }).to eql(false)
				expect(arr.my_all? { |i| i.nil? }).to eql(false)
			end
		end
	end

	describe ".my_any?" do
		context "when array is empty" do
			it "returns true" do
				expect(empty.my_any? { |i| i }).to eql(true)
			end
		end

		context "when no block" do
			it "return true" do
				expect(arr.my_any?()).to eql(true)
			end
		end

		context "block given" do
			it "returns true" do
				expect(arr.my_any? { |i| i > 0 }).to eql(true)
				expect(arr.my_any? { |i| i < 4 }).to eql(true)
				expect(arr.my_any? { |i| i.integer? }).to eql(true)
			end

			it "returns false" do
				expect(arr.my_any? { |i| i < 0 }).to eql(false)
				expect(arr.my_any? { |i| i >= 9 }).to eql(false)
				expect(arr.my_any? { |i| i.nil? }).to eql(false)
			end
		end
	end

	describe ".my_count" do
		context "no argument or block given" do
			it "returns size of array" do
				expect(arr.my_count).to eql(arr.size)
				expect(empty.my_count).to eql(empty.size)
			end
		end

		context "argument is given" do
			it "returns a total of all elements equal to the argument" do
				expect(arr.my_count(2)).to eql(1)
			end
		end

		context "block is given" do
			it "returns total number of times block returns true" do
				expect(arr.my_count { |i| i == 2 }).to eql(1)
			end
		end
	end

	describe ".my_map" do
		context "no block is given" do
			it "returns enumerable object" do
				expect(arr.my_map).to be_instance_of(Enumerator)
			end
		end

		context "when a block is given" do
      		it "returns an array object" do
        		expect(arr.my_map {|num| num}).to be_instance_of(Array)
      		end

      		it "creates a new array containing the values returned by the block" do
		        expect(arr.my_map {|x| x + 2}).to eql([3,4,5,6,7,8])
		        expect(empty.my_map {|x| x + 1}).to eql(empty)
			end
		end
	end


end