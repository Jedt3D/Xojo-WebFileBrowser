#tag WebPage
Begin WebPage WebPage1
   AllowTabOrderWrap=   True
   Compatibility   =   ""
   ControlID       =   ""
   Enabled         =   False
   Height          =   588
   ImplicitInstance=   True
   Index           =   -2147483648
   Indicator       =   0
   IsImplicitInstance=   False
   LayoutDirection =   0
   LayoutType      =   0
   Left            =   0
   LockBottom      =   False
   LockHorizontal  =   False
   LockLeft        =   True
   LockRight       =   False
   LockTop         =   True
   LockVertical    =   False
   MinimumHeight   =   400
   MinimumWidth    =   600
   TabIndex        =   0
   Title           =   "Web File Browser"
   Top             =   0
   Visible         =   True
   Width           =   820
   _ImplicitInstance=   False
   _mDesignHeight  =   0
   _mDesignWidth   =   0
   _mPanelIndex    =   -1
   Begin WebListBox lbxFiles
      ColumnCount     =   1
      ColumnWidths    =   ""
      ControlID       =   ""
      Enabled         =   True
      HasHeader       =   True
      Height          =   509
      HighlightSortedColumn=   True
      Index           =   -2147483648
      Indicator       =   0
      InitialValue    =   ""
      LastAddedRowIndex=   0
      LastRowIndex    =   0
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      NoRowsMessage   =   ""
      ProcessingMessage=   ""
      RowCount        =   0
      RowSelectionType=   1
      Scope           =   0
      SearchCriteria  =   ""
      SelectedRowColor=   &c0272D300
      SelectedRowIndex=   0
      TabIndex        =   0
      Tooltip         =   ""
      Top             =   66
      Visible         =   True
      Width           =   475
      _mPanelIndex    =   -1
   End
   Begin WebTextArea2 tarInfo
      AllowReturnKey  =   True
      AllowSpellChecking=   False
      Caption         =   ""
      ControlID       =   ""
      CurrentText     =   ""
      Enabled         =   True
      Height          =   269
      Hint            =   ""
      Index           =   -2147483648
      Indicator       =   0
      Left            =   503
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      MaximumCharactersAllowed=   0
      ReadOnly        =   True
      Scope           =   0
      TabIndex        =   1
      Text            =   ""
      TextAlignment   =   0
      Tooltip         =   ""
      Top             =   20
      Visible         =   True
      Width           =   297
      _mPanelIndex    =   -1
   End
   Begin WebImageViewer imvFile
      ControlID       =   ""
      Enabled         =   True
      Height          =   232
      HorizontalAlignment=   2
      Index           =   -2147483648
      Indicator       =   0
      Left            =   503
      LockBottom      =   True
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      Picture         =   115877887
      Scope           =   0
      SVGData         =   ""
      TabIndex        =   2
      Tooltip         =   ""
      Top             =   343
      URL             =   ""
      VerticalAlignment=   2
      Visible         =   True
      Width           =   297
      _mPanelIndex    =   -1
      _ProtectImage   =   False
   End
   Begin WebFileUploader fileUploader
      Caption         =   "Select"
      ControlID       =   ""
      Enabled         =   True
      Filter          =   "image/jpg;image/png"
      Height          =   38
      Hint            =   ""
      Index           =   -2147483648
      Indicator       =   ""
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      MaximumBytes    =   0
      MaximumFileCount=   1
      Scope           =   0
      TabIndex        =   3
      TabStop         =   True
      Tooltip         =   ""
      Top             =   20
      UploadTimeout   =   0
      Visible         =   True
      Width           =   367
      _mPanelIndex    =   -1
   End
   Begin WebButton btnUpload
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Upload"
      ControlID       =   ""
      Default         =   True
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   1
      Left            =   395
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Scope           =   0
      TabIndex        =   4
      TabStop         =   True
      Tooltip         =   ""
      Top             =   20
      Visible         =   True
      Width           =   100
      _mPanelIndex    =   -1
   End
   Begin WebLink Link1
      Appearance      =   0
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   38
      Index           =   -2147483648
      indicator       =   0
      Italic          =   False
      Left            =   503
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      Multiline       =   False
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   5
      TabStop         =   True
      Target          =   1
      Text            =   "..."
      TextAlignment   =   0
      TextColor       =   &c0000FF00
      Tooltip         =   ""
      Top             =   297
      Underline       =   False
      URL             =   ""
      Visible         =   True
      Width           =   297
      _mPanelIndex    =   -1
   End
End
#tag EndWebPage

#tag WindowCode
	#tag Method, Flags = &h0
		Sub GoIntoFolder(destination As FolderItem, fileListBox As WebListBox)
		  Var f As FolderItem
		  
		  If fileListBox.SelectedRowIndex > 0  Then
		    f = New FolderItem(destination)
		    If f.IsFolder Then
		      Try
		        ListFiles(f)
		        Session.CurrentFolder = f
		      Catch e As IOException
		        f = New FolderItem(SpecialFolder.UserHome)
		        ListFiles(f)
		        MessageBox("Error:" + e.Message)
		      End Try
		      
		    End If
		  ElseIf fileListBox.SelectedRowIndex = 0 Then
		    f = New FolderItem(Session.CurrentFolder.Parent)
		    ListFiles(f)
		    Session.CurrentFolder = f 
		    imvFile.Picture = xojologo
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ListFiles(startFolder as FolderItem)
		  lbxFiles.RemoveAllRows
		  tarInfo.Text = ""
		  
		  lbxFiles.AddRow("[Go ⬆️ ..]")
		  
		  For Each file As FolderItem In startFolder.Children
		    lbxFiles.AddRow(file.DisplayName)
		  Next
		  
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events lbxFiles
	#tag Event
		Sub Opening()
		  Var f As New FolderItem(SpecialFolder.UserHome)
		  
		  Session.CurrentFolder = f
		  
		  me.HeaderAt(0) = "Folders and Files"
		  
		  ListFiles(f)
		End Sub
	#tag EndEvent
	#tag Event
		Sub SelectionChanged(Rows() as Integer)
		  #Pragma Unused Rows
		  
		  Var f As FolderItem
		  
		  If Me.SelectedRowIndex > 0 Then
		    ' List information
		    f = New FolderItem(Session.CurrentFolder.Child(Me.SelectedRowValue))
		    tarInfo.appendtext(_
		    "----------------" + EndOfLine _
		    + "RowIndex:" + Me.SelectedRowIndex.ToString + EndOfLine _
		    + Me.SelectedRowValue + EndOfLine _
		    + f.NativePath )
		    
		    ' try to show known image files
		    Var ext As String
		    ext = f.DisplayName.Lowercase
		    
		    If ext.Right(3) = "png" Or ext.Right(3) = "jpg" Then
		      // show image preview and setup the download link
		      imvFile.Picture = Picture.Open(f)
		      link1.Text = "Download: " + f.DisplayName
		      link1.URL = imvFile.Picture.URL
		    ElseIf ext.Right(3) = "txt" Or ext.Right(3) = "log" Then
		      // read text file or log file
		      Var Input As TextInputStream
		      Input = TextInputStream.Open(f)
		      tarInfo.Text = Input.ReadAll
		    Else
		      imvFile.Picture = xojologo
		      link1.Text = "..."
		      link1.URL = "#"
		    End If
		  End If
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub DoublePressed(row as integer, column as integer)
		  #Pragma Unused row
		  #Pragma Unused column
		  
		  GoIntoFolder(Session.CurrentFolder.Child(Me.SelectedRowValue), lbxFiles)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events fileUploader
	#tag Event
		Sub UploadStarted(FileCount As Integer)
		  #Pragma Unused FileCount
		  
		  tarInfo.AppendReverse("File is uploading...")
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub UploadProgressed(Percent as Integer)
		  tarInfo.AppendReverse(Percent.ToString + " uploaded...")
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub UploadFinished(Files() As WebUploadedFile)
		  tarInfo.AppendReverse("File uploaded successfully")
		  
		  // saving the uploaded file
		  // only to "upload" folder in User Home
		  Var outputfile As FolderItem
		  
		  Try
		    outputfile = New FolderItem(SpecialFolder.UserHome.NativePath + "upload/"+Files(0).Name)
		    files(0).save(outputfile)
		    
		    imvFile.Picture = Picture.Open(outputfile)
		    link1.Text = "Download: " + outputfile.DisplayName
		    link1.URL = imvFile.Picture.URL
		    
		  Catch e As IOException
		    MessageBox("Error:" + e.Message)
		  End Try
		  
		  GoIntoFolder(Session.CurrentFolder.Child("upload"),lbxFiles)
		End Sub
	#tag EndEvent
	#tag Event
		Sub UploadError(error as RuntimeException)
		  tarInfo.AppendReverse("File uploading is Error. " + EndOfLine + error.Message)
		End Sub
	#tag EndEvent
	#tag Event
		Sub FileAdded(Filename As String, Bytes as UInt64, MimeType as String)
		  #Pragma Unused Filename
		  #Pragma Unused MimeType
		  
		  tarInfo.AppendReverse("One file added: " + Filename + "(" + Bytes.ToString + " bytes)")
		  
		  Var f As FolderItem
		  
		  f = New FolderItem(SpecialFolder.UserHome.NativePath + "upload")
		  If Not f.Exists Then
		    f.CreateFolder
		  End If
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Shown()
		  Me.Filter = "image/png;image/jpeg"
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnUpload
	#tag Event
		Sub Pressed()
		  fileUploader.StartUpload
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="_mPanelIndex"
		Visible=false
		Group="Behavior"
		InitialValue="-1"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Index"
		Visible=true
		Group="ID"
		InitialValue="-2147483648"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ControlID"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Enabled"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Behavior"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LayoutType"
		Visible=true
		Group="Behavior"
		InitialValue="LayoutTypes.Fixed"
		Type="LayoutTypes"
		EditorType="Enum"
		#tag EnumValues
			"0 - Fixed"
			"1 - Flex"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockBottom"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockHorizontal"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockLeft"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockRight"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockTop"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockVertical"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Behavior"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Behavior"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Behavior"
		InitialValue="Untitled"
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=false
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Behavior"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="_ImplicitInstance"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="_mDesignHeight"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="_mDesignWidth"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="_mName"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="IsImplicitInstance"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowTabOrderWrap"
		Visible=false
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIndex"
		Visible=true
		Group="Visual Controls"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Indicator"
		Visible=false
		Group="Visual Controls"
		InitialValue=""
		Type="WebUIControl.Indicators"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Primary"
			"2 - Secondary"
			"3 - Success"
			"4 - Danger"
			"5 - Warning"
			"6 - Info"
			"7 - Light"
			"8 - Dark"
			"9 - Link"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="LayoutDirection"
		Visible=true
		Group="WebView"
		InitialValue="LayoutDirections.LeftToRight"
		Type="LayoutDirections"
		EditorType="Enum"
		#tag EnumValues
			"0 - LeftToRight"
			"1 - RightToLeft"
			"2 - TopToBottom"
			"3 - BottomToTop"
		#tag EndEnumValues
	#tag EndViewProperty
#tag EndViewBehavior
