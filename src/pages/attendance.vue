
<template>
  <f7-page name="attendance" >
    <f7-navbar title="Calendar" back-link="Back"></f7-navbar>

    <f7-block>
      <p>Calendar is a touch optimized component that provides an easy way to handle dates.</p>
      <p>
        Calendar could be used as inline component or as overlay. Overlay Calendar will be
        automatically converted to Popover on tablets (iPad).
      </p>
    </f7-block>

    <f7-block-title>Default setup</f7-block-title>
    <f7-list strong-ios outline-ios>
      <f7-list-input type="datepicker" placeholder="Pilih hari" readonly />
    </f7-list>
  </f7-page>
</template>
<script>
export default {
  methods: {
  },
};
</script>