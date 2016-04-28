require "rails_helper"

RSpec.describe '/events', type: :feature do
  subject { page }
  describe '/events' do
    let!(:events) { create_list :event, 3 }
    before do
      visit events_path
    end

    it { should have_content events.sample.title }
    it { should have_link('Show', event_path(events.sample)) }

    context 'click show link' do
      before do
        find_link('Show', href: event_path(events.first)).click
      end

      it 'should work show link' do
        current_path.should eq event_path(events.first)
      end
    end
  end

  describe '/events/:id' do
    let(:event) { create :event }
    before do
      visit event_path event
    end

    it { should have_content event.title }
    it { should have_content event.hold_at }
    it { should have_content event.capacity }
    it { should have_content event.location }
    it { should have_content event.owner }
    it { should have_content event.description }

    context 'not logged-in' do
      before do
        visit event_path event
      end

      it { should_not have_link('Edit', edit_event_path(event)) }
      it { should_not have_link('Destroy', event_path(event)) }
    end

    context 'logged-in' do
      before do
        login! event.user
        visit event_path event
      end

      it { should have_link('Edit', edit_event_path(event)) }
      it { should have_link('Destroy', event_path(event)) }

      context 'click edit link' do
        before do
          find_link('Edit', href: edit_event_path(event)).click
        end

        it { current_path.should eq edit_event_path(event) }
      end

      context 'click destroy link' do
        before do
          find_link('Destroy', href: event_path(event)).click
        end

        it { current_path.should eq events_path }
        it 'should not have deleted event' do
          should_not have_content event.description
        end
      end
    end
  end

  describe '/events/new' do
    context 'not logged-in' do
      before do
        visit new_event_path
      end

      it 'should redirect events_path' do
        current_path.should eq events_path
      end
      it { should have_content 'Please login first.' }
    end

    context 'logged-in' do
      let(:user) { create :user }
      let(:title) { 'test title' }
      before do
        login! user
        visit new_event_path
        fill_in 'Title', with: title
        fill_in 'Capacity', with: 10
        fill_in 'Location', with: 'test location'
        fill_in 'Owner', with: 'test owner'
        fill_in 'Description', with: 'test description'
        click_button 'Create Event'
      end

      it { current_path.should eq event_path(Event.last) }
      it { should have_content title }
    end
  end

  describe '/events/edit' do
    let(:event) { create :event }

    context 'not logged-in' do
      before do
        visit edit_event_path event
      end

      it 'should redirect events_path' do
        current_path.should eq events_path
      end
      it { should have_content 'Please login first.' }
    end

    context 'logged-in' do
      let(:title) { 'test title' }
      before do
        login! event.user
        visit edit_event_path event
        fill_in 'Title', with: title
        click_button 'Update Event'
      end

      it { current_path.should eq event_path(Event.last) }
      it { should have_content title }
    end
  end

end
