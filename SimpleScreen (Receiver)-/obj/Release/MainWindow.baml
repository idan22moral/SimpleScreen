   M S B A M L   `   `   `  ���� R  NSimpleScreen (Receiver), Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullA%clr-namespace:SimpleScreen__Receiver_SimpleScreen__Receiver_  (    "SimpleScreen__Receiver_.MainWindow   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     7local%clr-namespace:SimpleScreen__Receiver_       � Title$  SimpleScreen (Receiver)��$	��350��$	��550�� � 
ResizeMode$ CanMinimize=� � WindowStyle$
 None=� � 	Resources    BlueToGreenGradient �� EndPoint � MappingMode �� 
StartPoint � Color � Offset  ButtonBrush  ButtonHoverBrush  TextBoxStyle	 �� 
TargetType
 �� Property �� Value �� Triggers P� Property P� Value  ButtonStyle  ButtonStyleNoHighlighting �� 
TargetType'  !System.Windows.VisualStateManager   VisualStateGroups%  System.Windows.VisualStateGroup   States   System.Windows.VisualState��%q  &	        &	 n     &	      &	 �     &	 �     &	 T    �� $ 0.5,1&�$ RelativeToBoundingBox=�$ 0.5,0&�.��� $ 	#FF005DFF��� $ 	#FF00FF97��$ 1Q���#36393F����#2F3136���� "	 ��.��� 
 � ��$ 0q� P�  �@J�IsMouseOver . . ��� 
 � ��$ 0q��� "	 ��.��� 
 � �� �	#FF2F3136 P�  �@J�IsMouseOver . . ��� 
 � ��# �  �� "	 ��.��� 
 � �� �� " ��.R�� #��z��   CommonStates��.   
Normal���� 
 � ��
 �   � P�  �@J�IsMouseOver . . ��� 
 �@�Cursor$
 Hand���� 
 �@J�Opacity$	 0.2Q�.��� ���	#FF1E2124.+��� -    ��Name$ WaitText��$��Waiting for Stream��$��100,120q�$��Product Sans)�$��36(�
�������$��Center=�$��Center=��� -    ��Name$ DraggableRectangle��$��37��$	��Top=�$��0,0,67.735,0q����	#001E2124�� -    ��Name$ 
ExitButton��#���  $�� ��$��Right=�$��	0,10,10,0q�$	��Top=�$��20��$��20����Z� ��Z� ����  �� ImageSource$ Images/ExitImage.png���� -   $ MinimizeButton��#���  $�� ��$��Right=�$��	0,10,35,0q�$	��Top=�$��20��$��20����Z� ��Z� ���� $ Images/MinimizeImage.png���� -    ��Name$ StreamImage��$��10,42,10,10q�