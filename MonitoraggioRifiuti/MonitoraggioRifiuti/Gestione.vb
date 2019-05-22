Option Infer On
Option Strict On

Public Class Gestione
    Private Sub Gestione_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        'TODO: questa riga di codice carica i dati nella tabella 'SicuraDataSet.Codici_CER'. È possibile spostarla o rimuoverla se necessario.
        Me.Codici_CERTableAdapter.FillCodiciCer(Me.SicuraDataSet.Codici_CER)
        'TODO: questa riga di codice carica i dati nella tabella 'SicuraDataSet.EXTRATESTERIFIUTI'. È possibile spostarla o rimuoverla se necessario.
        Me.EXTRATESTERIFIUTITableAdapter.FillExtraTesteRifiuti(Me.SicuraDataSet.EXTRATESTERIFIUTI)
        'TODO: questa riga di codice carica i dati nella tabella 'SicuraDataSet.Biri_MonitoraggioRifiuti'. È possibile spostarla o rimuoverla se necessario.
        Me.Biri_MonitoraggioRifiutiTableAdapter.FillMonitoraggio(Me.SicuraDataSet.Biri_MonitoraggioRifiuti)

    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click


        'Dim IsDirty As Boolean = DirectCast(DirectCast(sender, CurrencyManager).Current, DataRowView).Row.RowState = DataRowState.Modified

        'If IsDirty Then
        Try
            Dim result As New DialogResult
            result = MessageBox.Show("Vuoi Salvare le informazioni per la riga selezionata?", "Salvataggio Dati",
                            MessageBoxButtons.YesNo, MessageBoxIcon.Question)
            If result = DialogResult.Yes Then
                Me.Validate()
                Me.EXTRATESTERIFIUTIBindingSource.EndEdit()
                Me.EXTRATESTERIFIUTITableAdapter.Update(Me.SicuraDataSet.EXTRATESTERIFIUTI)

                MessageBox.Show("Salvataggio eseguito con Successo!", "Salvataggio Dati", MessageBoxButtons.OK, MessageBoxIcon.Information)
                Me.EXTRATESTERIFIUTITableAdapter.FillExtraTesteRifiuti(Me.SicuraDataSet.EXTRATESTERIFIUTI)

                '        Else
                '       Return
            End If


        Catch ex As Exception
            MessageBox.Show("Salvataggio Dati Fallito!!!", "Salvataggio Dati" & vbNewLine & "--> " & ex.Message.ToString,
                            MessageBoxButtons.OK, MessageBoxIcon.Stop)
        End Try

    End Sub

    Private Sub BindingNavigatorAddNewItem1_Click(sender As Object, e As EventArgs) Handles BindingNavigatorAddNewItem1.Click


        Me.EXTRATESTERIFIUTITableAdapter.Insert(CDec(Biri_MonitoraggioRifiutiDataGridView.CurrentRow.Cells(0).Value),
                                                Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Now, Nothing)
        Me.EXTRATESTERIFIUTITableAdapter.Update(SicuraDataSet.EXTRATESTERIFIUTI)
    End Sub





    Private Sub Show_oDTPFormulario(target As TextBox)

        Dim rect As Rectangle = target.DisplayRectangle()
        Dim x As Integer = rect.X + target.Left
        Dim y As Integer = rect.Y + target.Top
        Dim width = rect.Width + 4
        Dim height = rect.Height

        With oDTPFormulario
            .SetBounds(x, y, width, height)
            .Visible = True
            .Focus()
        End With

    End Sub

    Private Sub Show_oDTPRitiro(target As TextBox)

        Dim rect As Rectangle = target.DisplayRectangle()
        Dim x As Integer = rect.X + target.Left
        Dim y As Integer = rect.Y + target.Top
        Dim width = rect.Width + 4
        Dim height = rect.Height

        With oDTPRitiro
            .SetBounds(x, y, width, height)
            .Visible = True
            .Focus()
        End With

    End Sub

    Private Sub DataRitiroTb_DoubleClick(sender As Object, e As EventArgs) Handles DataRitiroTb.DoubleClick
        Dim Txt As System.Windows.Forms.TextBox = DirectCast(sender, TextBox)
        oDTPRitiro.Visible = False
        Show_oDTPRitiro(Txt)
        '
    End Sub



    Private Sub oDTPRitiro_ValueChanged(sender As Object, e As EventArgs) Handles oDTPRitiro.ValueChanged
        DataRitiroTb.Text = oDTPRitiro.Value.ToString()
        oDTPRitiro.Visible = False
    End Sub

    Private Sub oDTPFormulario_ValueChanged(sender As Object, e As EventArgs) Handles oDTPFormulario.ValueChanged
        DataFormularioTB.Text = oDTPFormulario.Value.ToString()
        oDTPFormulario.Visible = False
    End Sub

    Private Sub DataFormularioTB_DoubleClick(sender As Object, e As EventArgs) Handles DataFormularioTB.DoubleClick

        Dim Txt As System.Windows.Forms.TextBox = DirectCast(sender, TextBox)
        oDTPFormulario.Visible = False
        Show_oDTPFormulario(Txt)
        '


    End Sub




    Private Sub EXTRATESTERIFIUTIBindingSource_CurrentChanged(sender As Object, e As EventArgs) Handles EXTRATESTERIFIUTIBindingSource.CurrentChanged
        If BindingNavigatorCountItem1.Text = "di 0" Then
            'If Not String.IsNullOrEmpty(BindingNavigatorCountItem1.Text) Then

            'BindingNavigatorAddNewItem1.Enabled = Not 
            BindingNavigatorAddNewItem1.Enabled = True
        Else
            BindingNavigatorAddNewItem1.Enabled = False

        End If
    End Sub

    Private Sub ComboBox1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ComboBox1.SelectedIndexChanged
        'TIPORIFIUTOComboBox.Text = ComboBox1.V
    End Sub
End Class