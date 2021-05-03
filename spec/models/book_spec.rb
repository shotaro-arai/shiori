require 'rails_helper'

RSpec.describe Book, type: :model do
  before do
    @book = FactoryBot.build(:book)
  end

  describe '新規投稿' do
    context '投稿成功' do
      it 'すべての値を正しく入力すれば新規投稿できる' do
        expect(@book).to be_valid
      end

      it 'title_optionの値はなくても新規投稿できる' do
        @book.title_option = ''
        expect(@book).to be_valid
      end

      it 'imageの値はなくても新規投稿できる' do
        @book.image = nil
        expect(@book).to be_valid
      end
    end
  end

  context '投稿失敗' do
    it 'textの値がないと新規投稿できない' do
      @book.text = ''
      @book.valid?
      expect(@book.errors.full_messages).to include('あなたのことばを入力してください')
    end

    it 'textの値が140文字を超えると新規投稿できない' do
      @book.text = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' # 141文字
      @book.valid?
      expect(@book.errors.full_messages).to include('あなたのことばは140文字以内で入力してください')
    end

    it 'quoteの値がないと新規投稿できない' do
      @book.quote = ''
      @book.valid?
      expect(@book.errors.full_messages).to include('引用した一節を入力してください')
    end

    it 'quoteの値が140文字を超えると新規投稿できない' do
      @book.quote = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' # 141文字
      @book.valid?
      expect(@book.errors.full_messages).to include('引用した一節は140文字以内で入力してください')
    end

    it 'titleの値がないと新規投稿できない' do
      @book.title = ''
      @book.valid?
      expect(@book.errors.full_messages).to include('本の題名を入力してください')
    end

    it 'authorの値がないと新規投稿できない' do
      @book.author = ''
      @book.valid?
      expect(@book.errors.full_messages).to include('本の著者名を入力してください')
    end

    it 'publishの値がないと新規投稿できない' do
      @book.publish = ''
      @book.valid?
      expect(@book.errors.full_messages).to include('出版社名を入力してください')
    end

    it 'yearの値がないと新規投稿できない' do
      @book.year = ''
      @book.valid?
      expect(@book.errors.full_messages).to include('本の出版された年(西暦)を入力してください')
    end

    it 'yearの値は数字以外だと新規投稿できない' do
      @book.year = '令和2年'
      @book.valid?
      expect(@book.errors.full_messages).to include('本の出版された年(西暦)は数値で入力してください')
    end

    it 'yearの値は今年(現在: 2021)以上だと新規投稿できない' do
      @book.year = '2022'
      @book.valid?
      expect(@book.errors.full_messages).to include('本の出版された年(西暦)は2021以下の値にしてください')
    end

    it 'pageの値がないと新規投稿できない' do
      @book.page = ''
      @book.valid?
      expect(@book.errors.full_messages).to include('参照したページを入力してください')
    end

    it 'pageの値は数字以外だと新規投稿できない' do
      @book.page = '六十頁'
      @book.valid?
      expect(@book.errors.full_messages).to include('参照したページは数値で入力してください')
    end

    it 'userが紐付いていないと登録できない' do
      @book.user = nil
      @book.valid?
      expect(@book.errors.full_messages).to include('Userを入力してください')
    end
  end
end
