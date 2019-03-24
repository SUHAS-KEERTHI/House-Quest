require "test_helper"

describe InquiriesController do
  let(:inquiry) { inquiries :one }

  it "gets index" do
    get inquiries_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_inquiry_url
    value(response).must_be :success?
  end

  it "creates inquiry" do
    expect {
      post inquiries_url, params: { inquiry: { message: inquiry.message, subject: inquiry.subject, user_id: inquiry.user_id } }
    }.must_change "Inquiry.count"

    must_redirect_to inquiry_path(Inquiry.last)
  end

  it "shows inquiry" do
    get inquiry_url(inquiry)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_inquiry_url(inquiry)
    value(response).must_be :success?
  end

  it "updates inquiry" do
    patch inquiry_url(inquiry), params: { inquiry: { message: inquiry.message, subject: inquiry.subject, user_id: inquiry.user_id } }
    must_redirect_to inquiry_path(inquiry)
  end

  it "destroys inquiry" do
    expect {
      delete inquiry_url(inquiry)
    }.must_change "Inquiry.count", -1

    must_redirect_to inquiries_path
  end
end
