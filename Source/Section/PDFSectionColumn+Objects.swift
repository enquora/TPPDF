//
//  PDFSectionColumn+Objects.swift
//  TPPDF
//
//  Created by Marco Betschart on 05.05.18.
//

/**
This extension contains all functions to modify the objects of a section column
*/
public extension PDFSectionColumn {

	// MARK: - PUBLIC FUNCS

	// MARK: - Layout

	/**
	Adds a empty space in the given container, between the previous and the next element
	
	- parameter container: Container where the space will be set, defaults to `PDFSectionColumnContainer.left`
	- parameter space: Space distance in points
	*/
	public func addSpace(_ container: PDFSectionColumnContainer = PDFSectionColumnContainer.left, space: CGFloat) {
		objects += [(container, PDFSpaceObject(space: space))]
	}

	// MARK: - Lines

	/**
	Adds a horizontal line spearator to the given container. The line starts at the left indentation and ends at the right indentation.
	Customize by adjusting parameter `style`.
	
	- parameter container: Container where the space will be set, defaults to `PDFSectionColumnContainer.left`
	- parameter style: Style of line
	*/
	public func addLineSeparator(_ container: PDFSectionColumnContainer = PDFSectionColumnContainer.left, style: PDFLineStyle) {
		objects += [(container, PDFLineSeparatorObject(style: style))]
	}

	// MARK: - Image

	/**
	Adds an image to the given container.
	
	- parameter container: Container where the space will be set, defaults to `PDFSectionColumnContainer.left`
	- parameter image: Image object
	*/
	public func addImage(_ container: PDFSectionColumnContainer = PDFSectionColumnContainer.left, image: PDFImage) {
		objects += [(container, PDFImageObject(image: image))]
	}

	/**
	Adds an image row to the given container.
	This image row will fill the full available width between left indentation and right indentation.
	
	- parameter container: Container where the space will be set, defaults to `PDFSectionColumnContainer.left`
	- parameter images: Array of images, from left to right
	- parameter spacing: Horizontal distance between images
	*/
	public func addImagesInRow(_ container: PDFSectionColumnContainer = PDFSectionColumnContainer.left, images: [PDFImage], spacing: CGFloat = 5.0) {
		objects += [(container, PDFImageRowObject(images: images, spacing: spacing))]
	}

	// MARK: - Text

	/**
	Shorthand function to add a String text to the given container
	
	- parameter container: Container where the space will be set, defaults to `PDFSectionColumnContainer.left`
	- parameter images: Array of images, from left to right
	- parameter spacing: Horizontal distance between images
	*/
	public func addText(_ container: PDFSectionColumnContainer = PDFSectionColumnContainer.left, text: String, lineSpacing: CGFloat = 1.0) {
		addText(container, textObject: PDFSimpleText(text: text, spacing: lineSpacing))
	}

	/**
	Adds an text object to the given container
	
	- parameter container: Container where the space will be set, defaults to `PDFSectionColumnContainer.left`
	- parameter textObject: Simple text object
	*/
	public func addText(_ container: PDFSectionColumnContainer = PDFSectionColumnContainer.left, textObject: PDFSimpleText) {
		objects += [(container, PDFAttributedTextObject(simpleText: textObject))]
	}

	/**
	Shorthand function to add a attributed String text to the given container
	
	- parameter container: Container where the space will be set, defaults to `PDFSectionColumnContainer.left`
	- parameter text: An attributed string
	*/
	public func addAttributedText(_ container: PDFSectionColumnContainer = PDFSectionColumnContainer.left, text: NSAttributedString) {
		addAttributedText(container, textObject: PDFAttributedText(text: text))
	}

	/**
	Adds an attributed text object to the given container
	
	- parameter container: Container where the space will be set, defaults to `PDFSectionColumnContainer.left`
	- parameter textObject: Attributed text object
	*/
	public func addAttributedText(_ container: PDFSectionColumnContainer = PDFSectionColumnContainer.left, textObject: PDFAttributedText) {
		objects += [(container, PDFAttributedTextObject(attributedText: textObject))]
	}

	/**
	Set font in given container. This text color will be used when adding a `PDFSimpleText`
	
	- parameter container: Container where the font will be set, defaults to `PDFSectionColumnContainer.left`
	- parameter font: Font of text
	*/
	public func setFont(_ container: PDFSectionColumnContainer = PDFSectionColumnContainer.left, font: UIFont) {
		objects += [(container, PDFFontObject(font: font))]
	}

	/**
	Reset text color in given container to default.
	
	- parameter container: Container whose text color will be reset, defaults to `PDFSectionColumnContainer.left`
	*/
	public func resetFont(_ container: PDFSectionColumnContainer = PDFSectionColumnContainer.left) {
		objects += [(container, PDFFontObject(font: UIFont.systemFont(ofSize: UIFont.systemFontSize)))]
	}

	/**
	Set text color in given container. This text color will be used when adding a `PDFSimpleText`
	
	- parameter container: Container where the text color will be set, defaults to `PDFSectionColumnContainer.left`
	- parameter color: Color of the text
	*/
	public func setTextColor(_ container: PDFSectionColumnContainer = PDFSectionColumnContainer.left, color: UIColor) {
		objects += [(container, PDFTextColorObject(color: color))]
	}

	/**
	Reset text color in given container to default.
	
	- parameter container: Container whose text color will be reset, defaults to `PDFSectionColumnContainer.left`
	*/
	public func resetTextColor(_ container: PDFSectionColumnContainer = PDFSectionColumnContainer.left) {
		objects += [(container, PDFTextColorObject(color: UIColor.black))]
	}

	// MARK: - Table

	/**
	Adds a table object to the document in the defined container
	*/
	public func addTable(_ container: PDFSectionColumnContainer = PDFSectionColumnContainer.left, table: PDFTable) {
		objects += [(container, PDFTableObject(table: table))]
	}

	// MARK: - List

	/**
	Adds a list object to the document in the defined container
	*/
	public func addList(_ container: PDFSectionColumnContainer = PDFSectionColumnContainer.left, list: PDFList) {
		objects += [(container, PDFListObject(list: list))]
	}

	// MARK: - Layout

	/**
	Change the indentation in a container, use the parameter `left` to define from which side.
	
	- parameter container: Container whose indentation should be changed, defaults to `PDFSectionColumnContainer.left`
	- parameter indent: Points from the side
	- parameter left: If `true` then the left side indentation is set, else the right indentation is set
	*/
	public func setIndentation(_ container: PDFSectionColumnContainer = PDFSectionColumnContainer.left, indent: CGFloat, left: Bool) {
		objects += [(container, PDFIndentationObject(indentation: indent, left: left))]
	}

	/**
	Change the absolute top offset in a container
	
	- parameter container: Container whose current absolute offset should be changed, defaults to `PDFSectionColumnContainer.left`
	- parameter offset: Points from the top
	*/
	public func setAbsoluteOffset(_ container: PDFSectionColumnContainer = PDFSectionColumnContainer.left, offset: CGFloat) {
		objects += [(container, PDFOffsetObject(offset: offset))]
	}
}
