from django.shortcuts import render, redirect
from django.core.mail import send_mail
from django.conf import settings
from .forms import ContactForm


def home_view(request):
    if request.method == "POST":
        form = ContactForm(request.POST)
        if form.is_valid():
            name = form.cleaned_data["name"]
            subject = form.cleaned_data["subject"]
            email = form.cleaned_data["email"]
            message = form.cleaned_data["message"]

            # Send an email
            send_mail(
                subject,  # Subject of the email
                f"From: {name} <{email}>\n\n{message}",  # Message body
                settings.DEFAULT_FROM_EMAIL,  # From email
                ["ataylor@andyct.com"],  # To email
                fail_silently=False,
            )
            return redirect("contact_success")  # Redirect to success page
    else:
        form = ContactForm()

    return render(request, "actaylor/index.html", {"form": form})


def contact_success_view(request):
    return render(request, "actaylor/contact_success.html")
