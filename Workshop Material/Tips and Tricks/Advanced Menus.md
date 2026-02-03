# Advanced Menus with vCards

The built-in **Choose from Menu** and **Choose from List** actions only display a single line of text per option - unless the items are special types like App Store items, iTunes content, or Contacts. Contacts can show an icon, a title, and a subtitle.

Here's the trick: Contacts are just VCF files, and VCF files are just text. You can create fake contacts on the fly to build rich, visually appealing menus.

## How It Works

A contact's **Name** becomes the title, their **Organization** becomes the subtitle, and their **Photo** becomes the icon. By generating VCF text dynamically, you can create menus with any combination of these elements.

**Side note:** This is exactly how apps like [Menu Box](https://apps.apple.com/app/id6463440793), [Toolbox Pro](https://apps.apple.com/app/id1476205977), and [Actions](https://apps.apple.com/app/id1586435171) implement their advanced menu actions. They provide a friendlier interface for creating these fake contacts under the hood.

## The Basic VCF Structure

```
BEGIN:VCARD
VERSION:3.0
N:Menu Option Title
ORG:Optional subtitle text
PHOTO;BASE64:{base64-encoded-image}
END:VCARD
```

- **VERSION:3.0** ensures Unicode characters display correctly
- **N:** is the title (what appears as the contact's name)
- **ORG:** is the subtitle (what appears as the organization) - this is optional
- **PHOTO;BASE64:** is the icon as a base64-encoded image - also optional

To create multiple menu items, concatenate multiple vCard blocks in a single text.

## The Advanced VCF Structure

Beyond the visible fields, vCards support four additional fields that don't appear in the menu but can be retrieved after selection - perfect for storing hidden data like IDs, action identifiers, or metadata:

```
BEGIN:VCARD
VERSION:3.0
N:Menu Option Title
ORG:Optional subtitle text
PHOTO;BASE64:{base64-encoded-image}
TEL:{hidden-phone-value}
EMAIL:{hidden-email-value}
URL:{hidden-url-value}
NOTE:{hidden-note-value}
END:VCARD
```

- **TEL:** stores a value retrievable as "Phone Number"
- **EMAIL:** stores a value retrievable as "Email Address"
- **URL:** stores a value retrievable as "URL"
- **NOTE:** stores a value retrievable as "Notes"

You can use any combination of these four fields to pass data along with each menu item.

## Presenting the Menu

Once you've built your VCF text:

1. Use **Set Name** to rename the text to `menu.vcf`
2. Use **Get Contacts from Input** on the renamed item
3. Use **Choose from List** on the contacts

The user sees a beautiful menu with icons and subtitles. After they select an item, use **Get Details of Contact** on the chosen item to retrieve any field you need - Name, Organization, Phone Number, Email Address, URL, or Notes.

## Alternative: Using iOS Level Contacts

If you want less clutter in your shortcut and you're not willing to pay for such a small functionality, you can achieve the same using actual system contacts - provided your mail or contacts provider supports **contact groups** in iOS.

Create contact groups representing different contexts (e.g., "Home", "Work", "Travel"). Each contact in a group represents a menu option for that context, with its name, organization, photo, and the four hidden data fields serving the same purpose as in the vCard method.

The power comes from dynamic menus. In your shortcut you could for example do something like this:
- Check the current WiFi network → if you're at home, retrieve contacts from the "Home" group
- Check the active Focus mode → if it's "Work", retrieve contacts from the "Work" group
- Add all retrieved contacts to a variable
- Present the combined list via **Choose from List**

I used this exact approach for my Action Button menu. The menu stayed relevant to my situation - showing home-related actions when I was at home, work actions during focus time, and so on. The logic adapts automatically based on the conditions you define.

The only maintenance required is keeping the contacts in each group up to date - which you can do from any device that syncs with that account.

---

[← Previous: Working with APIs](Working%20with%20APIs.md) | [Back to Overview](README.md) | [Next: Coming Soon →]
